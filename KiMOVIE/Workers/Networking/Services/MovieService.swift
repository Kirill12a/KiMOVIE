//
//  MovieService.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation

protocol iMovieService: iNetworkServiceProtocol {

	func fetchPopularMovies(success: @escaping (MovieListResponseModel) -> (),
							failure: @escaping (FailureCompletion))

	func fetchDetailOfMovie(id: Int,
							success: @escaping (MovieDetailResponseModel) -> (),
							failure: @escaping (FailureCompletion))

	func fetchTopRatedMovies(success: @escaping (MovieListResponseModel) -> (),
							 failure: @escaping (FailureCompletion))

	func fetchNowPlayingMovies(success: @escaping (MoviesWithinDateRangeResponseModel) -> (),
							   failure: @escaping (FailureCompletion))

	func fetchUpcomingMovies(success: @escaping (MoviesWithinDateRangeResponseModel) -> (),
							 failure: @escaping (FailureCompletion))

	func fetchMovieReviews(id: Int,
						   success: @escaping (MovieReviewsResponseModel) -> (),
						   failure: @escaping (FailureCompletion))

	func searchMovie(query: String,
					 success: @escaping (MovieListResponseModel) -> (),
					 failure: @escaping (FailureCompletion))
} 

class MoviewService: iMovieService {

	let networkClient: iNetworkClientProtocol

	init(networkClient: iNetworkClientProtocol = NetworkClient.shared) {
		self.networkClient = networkClient
	}

	func fetchPopularMovies(success: @escaping (MovieListResponseModel) -> (),
							failure: @escaping (FailureCompletion)) {

		networkClient.makeRequest(route: .popularMovies,
								  responseModel: MovieListResponseModel.self,
								  success: success,
								  failed: failure)
	}

	func fetchDetailOfMovie(id: Int,
							success: @escaping (MovieDetailResponseModel) -> (),
							failure: @escaping (FailureCompletion)) {

		networkClient.makeRequest(route: .movieDetail(movieId: id),
								  responseModel: MovieDetailResponseModel.self,
								  success: success,
								  failed: failure)
	}

	func fetchTopRatedMovies(success: @escaping (MovieListResponseModel) -> (),
							 failure: @escaping (FailureCompletion)) {

		networkClient.makeRequest(route: .topRatedMovies,
								  responseModel: MovieListResponseModel.self,
								  success: success,
								  failed: failure)
	}

	func fetchNowPlayingMovies(success: @escaping (MoviesWithinDateRangeResponseModel) -> (),
							   failure: @escaping (FailureCompletion)) {

		networkClient.makeRequest(route: .nowPlayingMovies,
								  responseModel: MoviesWithinDateRangeResponseModel.self,
								  success: success,
								  failed: failure)
	}

	func fetchUpcomingMovies(success: @escaping (MoviesWithinDateRangeResponseModel) -> (),
							 failure: @escaping (FailureCompletion)) {

		networkClient.makeRequest(route: .upcomingMovies,
								  responseModel: MoviesWithinDateRangeResponseModel.self,
								  success: success,
								  failed: failure)
	}

	func fetchMovieReviews(id: Int,
						   success: @escaping (MovieReviewsResponseModel) -> (),
						   failure: @escaping (FailureCompletion)) {

		networkClient.makeRequest(route: .movieReviews(movieId: id),
								  responseModel: MovieReviewsResponseModel.self,
								  success: success,
								  failed: failure)
	}

	func searchMovie(query: String,
					 success: @escaping (MovieListResponseModel) -> (),
					 failure: @escaping (FailureCompletion)) {

		networkClient.makeRequest(route: .searchMovie(queryString: query),
								  responseModel: MovieListResponseModel.self,
								  success: success,
								  failed: failure)
	}
}
