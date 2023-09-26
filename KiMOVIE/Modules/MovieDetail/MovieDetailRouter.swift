//
//  MovieDetailRouter.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 26.09.2023.
//

import UIKit

@objc protocol iMovieDetailRoutingLogic {

}

protocol iMovieDetailDataPassing {
	var dataStore: iMovieDetailDataStore? { get }
}

class MovieDetailRouter: NSObject, iMovieDetailRoutingLogic, iMovieDetailDataPassing {
	weak var viewController: MovieDetailViewController?
	var dataStore: iMovieDetailDataStore?

}
