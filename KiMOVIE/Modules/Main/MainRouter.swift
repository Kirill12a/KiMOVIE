//
//  MainRouter.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import UIKit

protocol iMainRoutingLogic {
	func routeToMovieDetail()
}

protocol iMainDataPassing {
	var dataStore: iMainDataStore? { get }
	func passDataToMovieDetail(source: iMainDataStore, destination: inout iMovieDetailDataStore)

}

class MainRouter: NSObject {
	weak var viewController: MainViewController?
	var dataStore: iMainDataStore?
}

//MARK: -Routing logic implementation

extension MainRouter: iMainRoutingLogic {

	func routeToMovieDetail() {
		//		let movieDetailVC = MovieDetailBuilder.viewController()
		//		if var movieDetailDS = movieDetailVC.router?.dataStore, let homeDataStore = dataStore {
		//			passDataToMovieDetail(source: homeDataStore, destination: &movieDetailDS)
		//		}
		//		viewController?.navigationController?.pushViewController(movieDetailVC, animated: true)
	}
}

//MARK: -Data passing logic implementation

extension MainRouter: iMainDataPassing {
	func passDataToMovieDetail(source: iMainDataStore, destination: inout iMovieDetailDataStore) {
		if let categoryTapped = viewController?.categoryOfItemTapped, let index = viewController?.indexOfItemTapped {
			switch categoryTapped {
			case .topRated:
				destination.movieIdentifier = source.topRatedMovies[index.row].id ?? 0
			case .upcoming:
				destination.movieIdentifier = source.upcomingMovies[index.row].id ?? 0
			case .popular:
				destination.movieIdentifier = source.popularMovies[index.row].id ?? 0
			case .newReleases:
				destination.movieIdentifier = source.nowPlayingMovies[index.row].id ?? 0
			}
		}
	}
}

