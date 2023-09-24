//
//  MainInteractor.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation

protocol iMainBusinessLogic {
	func fetchMovies()
}

protocol iMainDataStore {
	var popularMovies: [MovieResultResponseModel] { get }
	var topRatedMovies: [MovieResultResponseModel] { get }
	var nowPlayingMovies: [MovieResultResponseModel] { get }
	var upcomingMovies: [MovieResultResponseModel] { get }
}


class MainInteractor: iMainDataStore {

	var presenter: iMainPresentationLogic?
	var movieService: iMovieService



	var popularMovies: [MovieResultResponseModel] = []
	var topRatedMovies: [MovieResultResponseModel] = []
	var nowPlayingMovies: [MovieResultResponseModel] = []
	var upcomingMovies: [MovieResultResponseModel] = []

	init(movieService: iMovieService = MoviewService()){
		self.movieService = movieService
	}
}

//MARK: - Реализация бизнес-логики -
extension MainInteractor: iMainBusinessLogic {


	//Получаем одновременно все фильмы, показанные на главном экране.

	private func allMovieListsAreaEmty() -> Bool {
	return	(self.popularMovies.isEmpty &&
			self.topRatedMovies.isEmpty &&
			self.nowPlayingMovies.isEmpty &&
			self.upcomingMovies.isEmpty
			)
	}



	func fetchMovies() {

		let dispatchGroup = DispatchGroup()

		// enter
		dispatchGroup.enter()
		movieService.fetchPopularMovies { populaerMoviesResponseModel in
			print("HELLLo fetchPopularMovies")
			self.popularMovies = populaerMoviesResponseModel.results ?? []
			dispatchGroup.leave()
		} failure: { error, networkError in
			self.popularMovies.removeAll()
			dispatchGroup.leave()
		}

		// enter
		dispatchGroup.enter()
		movieService.fetchTopRatedMovies { topRatedMoviesResponseModel in
			print("HELLLo fetchTopRatedMovies")
			self.topRatedMovies = topRatedMoviesResponseModel.results ?? []
			dispatchGroup.leave()
		} failure: { error, networkError in
			self.topRatedMovies.removeAll()
			dispatchGroup.leave()
		}

		// enter
		dispatchGroup.enter()
		movieService.fetchNowPlayingMovies { nowPlaying in
			print("HELLLo fetchNowPlayingMovies")
			self.nowPlayingMovies = nowPlaying.results ?? []
			dispatchGroup.leave()
		} failure: { error, networkError in
			self.nowPlayingMovies.removeAll()
			dispatchGroup.leave()
		}

		// enter
		dispatchGroup.enter()
		movieService.fetchUpcomingMovies { upcoming in
			print("HELLLo fetchUpcomingMovies")
			self.upcomingMovies = upcoming.results ?? []
			dispatchGroup.leave()
		} failure: { error, apiError in
			self.upcomingMovies.removeAll()
			dispatchGroup.leave()
		}


		dispatchGroup.notify(queue: .main) {
			print("HELLLo")
			self.allMovieListsAreaEmty()
			?
			self.presenter?.onGetMoviesForMainAllFailed()
			:
			self.presenter?.onGetMoviewForMainSucceed(popular: self.popularMovies,
													  topRated: self.topRatedMovies,
													  nowPlaying: self.nowPlayingMovies,
													  upcoming: self.upcomingMovies)
		}
	}


}
