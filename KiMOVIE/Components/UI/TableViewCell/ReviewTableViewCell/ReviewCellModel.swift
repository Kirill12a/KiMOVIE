//
//  ReviewCellModel.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 26.09.2023.
//

import Foundation

final class ReviewCellModel {

	var reviewRating: String?
	var author: String
	var reviewText: String
	var date: String

	init(reviewViewModel: MovieReviewViewModel){
		self.reviewRating = reviewViewModel.rating
		self.author = reviewViewModel.author
		self.reviewText = reviewViewModel.review
		self.date = reviewViewModel.date
	}
}

// MARK: - DrawerItemProtocol -

extension ReviewCellModel: iDrawerItem {
	var cellDrawer: iCellDrawer {
		return ReviewDrawer()
	}
}
