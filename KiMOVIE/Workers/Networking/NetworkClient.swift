//
//  NwtworkClient.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation
import Alamofire

typealias FailureCompletion = (Error, NetworkErrorType) -> ()

final class NetworkClient: iNetworkClientProtocol {
	static let shared = NetworkClient()

	private init(){}


	private var AFManager: Alamofire.Session = {
		var interceptor = Interceptor(adapters: [NetworkRequestAdapter()], retriers: [RetryPolicy(retryLimit: 1)])
		let session = Alamofire.Session(interceptor: interceptor)
		session.sessionConfiguration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
		return session
	}()

	func makeRequest<T>(route: NetworkRouter,
						responseModel: T.Type,
						success: @escaping (T) -> Void,
						failed: @escaping (Error, NetworkErrorType) -> Void) where T : Decodable {
		AFManager.request(route).validate(statusCode: NetworkParameters.validationRange).responseDecodable(of: responseModel) { response in
			switch response.result {
			case .success(let data):
				success(data)
			case .failure(let error):
				guard let statusCode = response.response?.statusCode else {
					failed(error, NetworkErrorType.generalServiceError)
					return
				}
				failed(error, StatusCodes.errorType(statusCode))
			}
		}
	}
}
