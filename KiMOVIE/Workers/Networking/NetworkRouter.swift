//
//  NetworkRouter.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation
import Alamofire

enum NetworkRouter {
	case nowPlayingMovies
	case topRatedMovies
	case upcomingMovies
	case popularMovies
	case movieDetail(movieId: Int)
	case movieCredits(movieId: Int)
	case movieReviews(movieId: Int)
	case searchMovie(queryString: String)
}

extension NetworkRouter: URLRequestConvertible {

	var method: HTTPMethod {
		switch self{
		case .popularMovies, .movieDetail, .nowPlayingMovies, .topRatedMovies, .upcomingMovies, .movieCredits, .movieReviews, .searchMovie:
			return .get
		}
	}

	var path: String {
		switch self {
		case .nowPlayingMovies:
			return NetworkEndpoints.MoviePath.nowPlayingMovies
		case .topRatedMovies:
			return NetworkEndpoints.MoviePath.topRatedMovies
		case .upcomingMovies:
			return NetworkEndpoints.MoviePath.upcomingMovies
		case .popularMovies:
			return NetworkEndpoints.MoviePath.popularMovies
		case .movieDetail(let movieId):
			return String(format: NetworkEndpoints.MoviePath.movieDetail, String(movieId))
		case .movieCredits(let movieId):
			return String(format: NetworkEndpoints.MoviePath.movieCredits, String(movieId))
		case .movieReviews(let movieId):
			return String(format: NetworkEndpoints.MoviePath.movieReviews, String(movieId))
		case .searchMovie:
			return NetworkEndpoints.SearchPath.movieSearch
		}
	}

	var parameters: Parameters? {
		switch self {
		case .searchMovie(queryString: let queryString):
			return [NetworkParameters.Search.key : queryString]
		default:
			return nil
		}

	}

	func asURLRequest() throws -> URLRequest {
		var urlRequest: URLRequest

		let url = try NetworkEndpoints.BaseURL.moviesBaseUrl.asURL()

		//MARK: - Создание запроса
		urlRequest = URLRequest(url: url.appendingPathComponent(path))
		//MARK: - Установка HTTP метода
		urlRequest.httpMethod = method.rawValue
		urlRequest.cachePolicy = .reloadIgnoringCacheData
		//MARK: - Установка параметров запроса
		urlRequest = try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
		//MARK: - Установка временных параметров зароса
		urlRequest.timeoutInterval = NetworkParameters.requestTimeOut

		return urlRequest
	}


}
