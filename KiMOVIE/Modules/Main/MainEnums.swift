//
//  MainEnums.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation


enum MainCategory {
	case topRated
	case upcoming
	case popular
	case newReleases

	var title: String {
		switch self {
		case .topRated:
			return Constants.MainCategories.topRated
		case .upcoming:
			return Constants.MainCategories.upcoming
		case .popular:
			return Constants.MainCategories.popular
		case .newReleases:
			return Constants.MainCategories.newReleases
		}
	}
}
