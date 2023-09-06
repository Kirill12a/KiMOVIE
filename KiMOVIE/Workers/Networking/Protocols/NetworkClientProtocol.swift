//
//  NetworkClientProtocol.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation

protocol iNetworkClientProtocol {
	/// Функция API, которая принимает конфигурацию маршрутизатора API, анализирует и возвращает модель ответа/ошибки.
	func makeRequest<T>(route: NetworkRouter,
						responseModel: T.Type,
						success: @escaping (T) -> Void,
						failed: @escaping (Error, NetworkErrorType) -> Void)  where T: Decodable

}

protocol iNetworkServiceProtocol {
	var networkClient: iNetworkClientProtocol {get}
}
