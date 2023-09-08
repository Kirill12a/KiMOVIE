//
//  File.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import UIKit

enum EmptyState {
	case home
	case detail
	case search

	var description: String{
		switch self{

		case .home:
			return Constants.EmptyStates.descriptions.home
		case .detail:
			return Constants.EmptyStates.descriptions.movieDetail
		case .search:
			return Constants.EmptyStates.descriptions.search
		}
	}


	/// FIXXXx
	var emptyImage: UIImage? {
		switch self{
		case .home:
			return Constants.EmptyStates.images.home
		case .detail:
			return Constants.EmptyStates.images.detail
		case .search:
			return Constants.EmptyStates.images.search
		}
	}
}
