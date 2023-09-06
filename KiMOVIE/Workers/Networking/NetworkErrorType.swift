//
//  NetworkErrorType.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation

 enum NetworkErrorType: Error {
	case generalServiceError
	case badRequestError
	case unauthorisedError
	case serviceUnavailable
	case jsonParsingError
}

 enum StatusCodes: Int {
	// MARK: - Client errors
	case Code400BadRequest = 400
	case Code401Unauthorised = 401
	case Code403Forbidden = 403
	case Code404NotFound = 404

	// MARK: - Server errors
	case Code500InternalServerError = 500
	case Code501NotImplemented = 501
	case Code502BadGateway = 502
	case Code503ServiceUnavailable = 503

	var code: Int {
		return rawValue
	}

	static func errorType(_ statusCode: Int) -> NetworkErrorType {
		switch statusCode {
		case StatusCodes.Code400BadRequest.code:
			return NetworkErrorType.badRequestError
		case StatusCodes.Code401Unauthorised.code:
			return NetworkErrorType.unauthorisedError
		case StatusCodes.Code500InternalServerError.code:
			return NetworkErrorType.serviceUnavailable
		default:
			return NetworkErrorType.generalServiceError
		}
	}
}
