//
//  MovieDetailPresenter.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 26.09.2023.
//

import UIKit

protocol iMovieDetailPresentationLogic {
	func presentMovieInfo(movieDetail: MovieDetailResponseModel,
						  casting: [MovieCastMemberResponseModel],
						  crew: [MovieCastMemberResponseModel],
						  reviews: [ReviewResultResponseModel])
	func presentMovieDetailError()
}

class MovieDetailPresenter {
	weak var viewController: iMovieDetailDisplayLogic?
}

extension MovieDetailPresenter: iMovieDetailPresentationLogic {
	func presentMovieInfo(movieDetail: MovieDetailResponseModel, casting: [MovieCastMemberResponseModel], crew: [MovieCastMemberResponseModel], reviews: [ReviewResultResponseModel]) {

		var cells: [iDrawerItem] = []

		//create movieInfoViewModel
		let movieInfoViewModel = MovieInfoViewModel.init(movieDetailResponseModel: movieDetail)

		//add the movie info cell
		cells.append(MovieDetailInfoCellModel.init(movieInfoVM: movieInfoViewModel))

		//add casting category cell
		if !casting.isEmpty {
			let castingViewModels: [MovieCastMemberViewModel] = casting.map({MovieCastMemberViewModel.init(castResponseModel: $0)})
			let castingCells: [iCollectionDrawerItem] = castingViewModels.map({CrewMemberCellModel.init(castVM: $0)})
			cells.append(MovieCategoryCellModel.init(title: Constants.MovieDetailCategories.actors, elementsToDisplay: castingCells, additionalInfo: MovieDetailCategories.actors, titleSize: 15))
		}

		//add crew category cell
		if !crew.isEmpty {
			let crewViewModels: [MovieCastMemberViewModel] = crew.map({MovieCastMemberViewModel.init(castResponseModel: $0)})
			let crewCells: [iCollectionDrawerItem] = crewViewModels.map({CrewMemberCellModel.init(castVM: $0)})
			cells.append(MovieCategoryCellModel.init(title: Constants.MovieDetailCategories.crew, elementsToDisplay: crewCells, additionalInfo: MovieDetailCategories.crew, titleSize: 15))
		}

		if !reviews.isEmpty{
			//casting reviews to reviews View models
			let reviewsVM: [MovieReviewViewModel] = reviews.map({MovieReviewViewModel.init(movieReviewResponseModel: $0)})
			//create reviews TABLE cells from the viewmodels
			let reviewCells: [iDrawerItem] = reviewsVM.map({ReviewCellModel.init(reviewViewModel: $0)})
			cells.append(contentsOf: reviewCells)
		}

		viewController?.displayMovieInfo(viewModel: MovieDetailViewModel.init(movieInfoVM: movieInfoViewModel, movieDetailCells: cells))
	}

	func presentMovieDetailError() {
		let emptyCell = EmptyStateCellModel.init(emptyState: .detail)
		viewController?.displayErrorFetchingMovieDetail(emptyStateCell: emptyCell)
	}


}
