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
	func onGetMoviewForMainSucceed(popular: [MovieResultResponseModel], topRated: [MovieResultResponseModel], nowPlaying: [MovieResultResponseModel], upcoming: [MovieResultResponseModel]){
		// анализируем модели ответов для моделей ячеек коллекции, отображаемых внутри каждой категории tableviewcell

		var categoryCells = [iDrawerItem]()

		if !popular.isEmpty{
			let popularCells : [iCollectionDrawerItem] = popular.map({MovieCollectionViewCellModel.init(moviewResponseModel: $0)})
			categoryCells.append(MovieCategoryCellModel.init(title: MainCategory.popular.title, elementsToDisplay: popularCells, additionalInfo: MainCategory.popular))

		}

		if !topRated.isEmpty{
			let topRatedCells : [iCollectionDrawerItem] = topRated.map({MovieCollectionViewCellModel.init(moviewResponseModel: $0)})
			categoryCells.append(MovieCategoryCellModel.init(title: MainCategory.topRated.title, elementsToDisplay: topRatedCells, additionalInfo: MainCategory.topRated))
		}

		if !nowPlaying.isEmpty{
			let nowPlayingCells : [iCollectionDrawerItem] = nowPlaying.map({MovieCollectionViewCellModel.init(moviewResponseModel: $0)})
			categoryCells.append(MovieCategoryCellModel.init(title: MainCategory.newReleases.title, elementsToDisplay: nowPlayingCells, additionalInfo: MainCategory.newReleases))
		}

		if !upcoming.isEmpty{
			let upcomingCells : [iCollectionDrawerItem] = upcoming.map({MovieCollectionViewCellModel.init(moviewResponseModel: $0)})
			categoryCells.append(MovieCategoryCellModel.init(title: MainCategory.upcoming.title, elementsToDisplay: upcomingCells, additionalInfo: MainCategory.upcoming))
		}

		let viewModel = MainViewModel.init(movieCategories: categoryCells)
		viewController?.loadCategoriesAndMovies(viewModel: viewModel)

	}

	func onGetMoviesForMainAllFailed() {
		//insert an emptystate cell in the viewmodel so the viewcontroller will show it
		//we could use the same method as "loadCategoriesAndMovies" but i made another one so we could implement additional logic like showing an alert...
		let emptyStateViewModel = MainViewModel.init(movieCategories: [EmptyStateCellModel.init(emptyState: EmptyState.home)])
		viewController?.showEmptyStateView(emptyStateViewModel: emptyStateViewModel)
	}
}
