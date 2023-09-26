//
//  MovieCategoryDrawer.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 24.09.2023.
//

import UIKit

final class MovieCategoryDrawer: iCellDrawer {
	func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		tableView.register(MovieCategoryCell.self, forCellReuseIdentifier: MovieCategoryCell.cellIdentifier())

		return tableView.dequeueReusableCell(withIdentifier: MovieCategoryCell.cellIdentifier(), for: indexPath)
	}

	func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath? = nil) {
		guard let cell = cell as? MovieCategoryCell, let cellVM = item as? MovieCategoryCellModel else {
			return
		}

		cell.setCategoryTitleLabelText(text: cellVM.categoryTitle)
		cell.setCollectionElementsToShow(cells: cellVM.elementsToShow)

		if let delegate = delegate as? iMovieCategoryTap{
			cell.setTapDelegate(delegate: delegate)
		}

		cell.setCategoryIdentifier(additionalInfo: cellVM.additionalInfo)
		cell.setTitleTextSize(size: cellVM.titleSize)
	}
}


