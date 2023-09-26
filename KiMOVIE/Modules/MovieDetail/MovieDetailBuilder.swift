//
//  MovieDetailBuilder.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 26.09.2023.
//

import UIKit

class MovieDetailBuilder {
	static func viewController() -> MovieDetailViewController {

		let viewController = MovieDetailViewController()
		let interactor = MovieDetailInteractor()
		let presenter = MovieDetailPresenter()
		let router = MovieDetailRouter()

		viewController.interactor = interactor
		viewController.router = router
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
		return viewController
	}
}
