//
//  MovieDetailInfoCellModel.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 26.09.2023.
//

import Foundation

final class MovieDetailInfoCellModel {

	var overView: String
	var vote: String?
	var imageURL: String?
	var companies: [String]

	init(movieInfoVM: MovieInfoViewModel){
		self.imageURL = movieInfoVM.detailImageUrl
		self.overView = movieInfoVM.overview
		self.vote = movieInfoVM.voteAverage
		self.companies = movieInfoVM.productionCompanies
	}
}

// MARK: - DrawerItemProtocol -

extension MovieDetailInfoCellModel: iDrawerItem {
	var cellDrawer: iCellDrawer {
		return MovieDetailInfoDrawer()
	}
}
