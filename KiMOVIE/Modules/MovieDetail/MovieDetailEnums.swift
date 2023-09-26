//
//  MovieDetailEnums.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 26.09.2023.
//

import Foundation

enum MovieDetailCategories {

	case actors
	case crew
	case reviews

	var title: String {
		switch self {
		case .actors:
			return Constants.MovieDetailCategories.actors
		case .crew:
			return Constants.MovieDetailCategories.crew
		case .reviews:
			return Constants.MovieDetailCategories.reviews
		}
	}
}
