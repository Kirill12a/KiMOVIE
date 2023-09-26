//
//  MovieDetailInteractor.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 07.09.2023.
//

import UIKit

protocol iMovieDetailBusinessLogic {
	func fetchMovieDetail()
}

protocol iMovieDetailDataStore {
	var movieIdentifier: Int! {get set}

	var castingMembers: [MovieCastMemberResponseModel] {get}
	var movieReviews: [ReviewResultResponseModel] {get}
	var movieDetail: MovieDetailResponseModel? {get}
}

class MovieDetailInteractor: iMovieDetailDataStore {
	

	var movieIdentifier: Int!

	// Начальная информация
	var movieDetail: MovieDetailResponseModel?

	//Дополнительная информация
	var castingMembers: [MovieCastMemberResponseModel] = []
	var crewMembers: [MovieCastMemberResponseModel] = []
	var movieReviews: [ReviewResultResponseModel] = []

	var presenter: iMovieDetailPresentationLogic?
	var movieService: iMovieService
	var castingService: iCastingService

	init(movieService: iMovieService = MoviewService(), castingService: iCastingService = CastingService()){
		self.movieService = movieService
		self.castingService = castingService
	}
}

extension MovieDetailInteractor: iMovieDetailBusinessLogic {

	func fetchMovieDetail() {
		let dispatchGroup = DispatchGroup()

		dispatchGroup.enter()
		movieService.fetchDetailOfMovie(id: self.movieIdentifier) { movieDetailResponseModel in
			self.movieDetail = movieDetailResponseModel
			dispatchGroup.leave()
		} failure: { error, apiError in
			dispatchGroup.leave()
		}

		dispatchGroup.enter()
		castingService.fetchMovieCredits(movieID: self.movieIdentifier) { (creditsResponseModel) in
			if let crew = creditsResponseModel.crew, let cast = creditsResponseModel.cast {

				//adding first 20 actors
				self.castingMembers = Array(cast.filter({$0.profilePath != nil}).prefix(20))

				//adding directors
				self.crewMembers = self.getCastOrCrewByDepartment(people: crew, department: .directing, maxNumberOfResults: 5)

				//adding writers
				self.crewMembers.append(contentsOf: self.getCastOrCrewByDepartment(people: crew, department: .writing, maxNumberOfResults: 5))

				//adding producers
				self.crewMembers.append(contentsOf: self.getCastOrCrewByDepartment(people: crew, department: .production, maxNumberOfResults: 5))
			}
			dispatchGroup.leave()
		} failure: { (error, apiError) in
			dispatchGroup.leave()
		}

		dispatchGroup.enter()
		movieService.fetchMovieReviews(id: movieIdentifier) { reviewsResponseModel in
			if let reviews = reviewsResponseModel.results {
				self.movieReviews = reviews
			}
			dispatchGroup.leave()
		} failure: { error, apiError in
			dispatchGroup.leave()
		}

		dispatchGroup.notify(queue: .main) {
			if let safeDetail = self.movieDetail {
				//если детали фильма успешны, мы это показываем, остальная дополнительная информация, такая как актерский состав или съемочная группа, является расходуемой
				self.presenter?.presentMovieInfo(movieDetail: safeDetail, casting: self.castingMembers, crew: self.crewMembers, reviews: self.movieReviews)
			} else {
				self.presenter?.presentMovieDetailError()
			}
		}



	}

	//набираем только интересных членов съемочной группы, таких как режиссер, сценаристы и продюсеры
	private func getCastOrCrewByDepartment(people: [MovieCastMemberResponseModel], department: CastMemberDepartment, maxNumberOfResults: Int)-> [MovieCastMemberResponseModel]{
		let filteredResults = people.filter({
			if let role = $0.department, $0.profilePath != nil {
				return role == department
			} else {
				return false
			}
		})
		return Array(filteredResults.prefix(maxNumberOfResults))
	}

}
