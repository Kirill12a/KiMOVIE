//
//  MovieCategoryCellModel.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 24.09.2023.
//

import UIKit

final class MovieCategoryCellModel {

	var categoryTitle: String
	var elementsToShow: [iCollectionDrawerItem]
	var additionalInfo: Any?
	var titleSize: CGFloat

	init(title: String, elementsToDisplay: [iCollectionDrawerItem], additionalInfo: Any? = false, titleSize: CGFloat = 20){
		self.categoryTitle = title
		self.elementsToShow = elementsToDisplay
		self.additionalInfo = additionalInfo
		self.titleSize = titleSize
	}

}

// MARK: - DrawerItemProtocol -

extension MovieCategoryCellModel: iDrawerItem {
	var cellDrawer: iCellDrawer {
		return MovieCategoryDrawer()
	}
}
