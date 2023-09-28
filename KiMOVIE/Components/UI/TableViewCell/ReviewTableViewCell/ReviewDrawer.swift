//
//  ReviewDrawer.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 26.09.2023.
//

import UIKit

final class ReviewDrawer: iCellDrawer {
	func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		tableView.register(ReviewCell.self, forCellReuseIdentifier: ReviewCell.cellIdentifier())
		return tableView.dequeueReusableCell(withIdentifier: ReviewCell.cellIdentifier(), for: indexPath)
	}

	func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath? = nil) {
		guard let cell = cell as? ReviewCell, let cellVM = item as? ReviewCellModel else {
			return
		}

		cell.setAuthor(text: cellVM.author)
		if let rating = cellVM.reviewRating{
			cell.setRating(text: rating)
		}

		cell.setMovieReview(text: cellVM.reviewText)

	}
}
