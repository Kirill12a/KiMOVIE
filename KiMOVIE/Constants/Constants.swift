//
//  Constants.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import UIKit


enum Constants {

	enum TabbarTitles {
		static let home = "home"
		static let soon = "soon"
		static let search = "search"
		static let about = "about"
	}

	enum MainCategories {
		static let popular = "category_popular"
		static let topRated = "category_topRated"
		static let newReleases = "category_newReleases"
		static let upcoming = "category_upcoming"
	}

	struct TableViewRefreshControl {
		static let description = "refresh_description"
	}

	enum EmptyStates {
		enum descriptions {
			static let home: String = "home_empty"
			static let movieDetail: String = "movie_empty"
			static let search: String = "search_empty"
		}
		enum images {
			static let home: UIImage? = UIImage(named: "homeEmptyState")
			static let search: UIImage? = UIImage(named: "searchEmptyState")
			static let detail: UIImage? = UIImage(named: "movieDetailEmptyState")
		}
	}


	enum Styles {
		static let mainColor: UIColor = .systemRed
		static let titleColor: UIColor = .white
		static let tabbarUnselectColor: UIColor = .white
		static let backGroundColor: UIColor = .black
		static let textInfoColor: UIColor = .white
		static let ratingColor: UIColor = .white
		static let tabbarStyleColor: UIBarStyle = .black
		static let reviewAuthorColor: UIColor = .white
		static let reviewTextColor: UIColor = .white
		static let emptyStateImageTint: UIColor = .red
		static let reviewBackgroundColor: UIColor = UIColor(red: 0.1568627451,
															green: 0,
															blue: 0.1568627451,
															alpha: 0.1568627451)
	}
}
