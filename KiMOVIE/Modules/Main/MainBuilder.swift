//
//  MainBuilder.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import UIKit

class MainBuilder {
	static func viewController() -> MainViewController {

		let viewController = MainViewController()
		let interactor = MainInteractor()
		let presenter = MainPresenter()
		let router = MainRouter()

		viewController.interactor = interactor
		viewController.router = router

		interactor.presenter = presenter

		presenter.viewController = viewController

		router.viewController = viewController
		router.dataStore = interactor

		return viewController
	}
}
