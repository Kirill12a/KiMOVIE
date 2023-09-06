//
//  CastingService.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation


protocol iCastingService: iNetworkServiceProtocol {

	func fetchMovieCredits(movieID: Int,
						   success: @escaping (MovieCreditsResponseModel) -> (),
						   failure: @escaping (FailureCompletion))
}

class CastingService: iCastingService {

	let networkClient: iNetworkClientProtocol

	init(networkClient: iNetworkClientProtocol = NetworkClient.shared) {
		self.networkClient = networkClient
	}

	func fetchMovieCredits(movieID: Int,
						   success: @escaping (MovieCreditsResponseModel) -> (),
						   failure: @escaping (FailureCompletion)) {

		networkClient.makeRequest(route: NetworkRouter.movieCredits(movieId: movieID),
								  responseModel: MovieCreditsResponseModel.self,
								  success: success,
								  failed: failure)
	}
}
