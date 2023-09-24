//
//  MovieCollectionViewCellModel.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 07.09.2023.
//

import Foundation

final class MovieCollectionViewCellModel {
	var movieTitle: String
	var moviePosterURL: String?

	init(moviewResponseModel: MovieResultResponseModel) {
		self.movieTitle = moviewResponseModel.title ?? ""

		if let posterEndpoint = moviewResponseModel.posterPath {
			self.moviePosterURL = MoviePosterSizes.medium.getFullUrlForSize(endpoint: posterEndpoint)
		}
	}
}

extension MovieCollectionViewCellModel: iCollectionDrawerItem {
	var collectionDrawer: iCollectionDrawer {
		return MoviewCollectionViewDrawer()
	}
}
