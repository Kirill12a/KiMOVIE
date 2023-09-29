//
//  MainTabbarController.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 05.09.2023.
//

import UIKit


final class MainTabbarController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()

		tabbarSetupStyle()
		assembly()

	}

	private func assembly() {
		let newFilmReleases = MainBuilder.viewController()
		newFilmReleases.tabBarItem = UITabBarItem(title: Constants.TabbarTitles.home, image: UIImage(systemName: "popcorn"), tag: 0)
		let homeNavigationConroller = CustomNavigationController(rootViewController: newFilmReleases)

		//MARK: - В след. обнове
//		let search = MovieSearchBuilder.viewController()
//		search.tabBarItem = UITabBarItem.init(title: Constants.TabbarTitles.search , image: UIImage.init(named: "search_item"), tag: 1)
//		let searchNavitgationController = CustomNavigationController.init(rootViewController: search)

		let tabBarList = [homeNavigationConroller]

		viewControllers = tabBarList
	}

	private func tabbarSetupStyle() {
		self.tabBar.barStyle = Constants.Styles.tabbarStyleColor
		self.tabBar.tintColor = Constants.Styles.mainColor
		self.tabBar.unselectedItemTintColor = Constants.Styles.tabbarUnselectColor
		self.tabBar.isTranslucent = false
	}
}
