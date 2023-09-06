//
//  NetworkRequestAdapter.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Alamofire
import Foundation

/// Выполняет адаптацию исходного запроса URLRequest, добавляя к нему параметры API-ключа MovieDBApiKey
final class NetworkRequestAdapter: RequestAdapter {
	func adapt(_ urlRequest: URLRequest,
			   for session: Alamofire.Session,
			   completion: @escaping (Result<URLRequest, Error>) -> Void) {
		let parameters = [NetworkParameters.MovieDBApiKey.apiKEY : NetworkParameters.MovieDBApiKey.keyValue]

		do {
			let validationRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
			completion(.success(validationRequest))
		} catch {
			completion(.failure(error))
		}
	}
}
