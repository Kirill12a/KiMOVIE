//
//  MainPresenter.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

//           (VM)
// PRESENTER ->> VIEW_MODEL

import UIKit



protocol iMainPresentationLogic {
	/// получение фильмов для main экрана
	func onGetMoviewForMainSucceed(popular: [MovieResultResponseModel],
								   topRated: [MovieResultResponseModel],
								   nowPlaying: [MovieResultResponseModel],
								   upcoming: [MovieResultResponseModel])

	func onGetMoviesForMainAllFailed()
}

class MainPresenter {

		weak var viewController: iMainDisplayLogic?



}

//MARK: - Реализация логики представления

extension MainPresenter: iMainPresentationLogic {
	func onGetMoviewForMainSucceed(popular: [MovieResultResponseModel], topRated: [MovieResultResponseModel], nowPlaying: [MovieResultResponseModel], upcoming: [MovieResultResponseModel]) {
		// анализируем модели ответов для моделей ячеек коллекции, отображаемых внутри каждой категории tableviewcell

		var categoryCell = [iDrawerItem]()

		if !popular.isEmpty {
//			let popularCells: [iCollectionDrawerItem] = popular.map({Movicollect})
		}
	}

	func onGetMoviesForMainAllFailed() {

	}


}
