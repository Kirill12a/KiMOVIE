//
//  MovieDetailInfoDrawer.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 26.09.2023.
//

import UIKit

final class MovieDetailInfoDrawer: iCellDrawer {
	func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		tableView.register(MovieDetailInfoCell.self, forCellReuseIdentifier: MovieDetailInfoCell.cellIdentifier())
		return tableView.dequeueReusableCell(withIdentifier: MovieDetailInfoCell.cellIdentifier(), for: indexPath)
	}

	func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath? = nil) {
		guard let cell = cell as? MovieDetailInfoCell, let cellVM = item as? MovieDetailInfoCellModel else {
			return
		}

		if let safeBackdrop = cellVM.imageURL{
			cell.setMovieBackdropImage(imageURL: safeBackdrop, placeholder: UIImage.init(named: "movieBackdropNotFound"))
		}else {
			cell.setMoviePlaceholder(image: UIImage.init(named: "movieBackdropNotFound"))
		}

		cell.setMovieOverview(text: cellVM.overView,size: 14)

	}
}
