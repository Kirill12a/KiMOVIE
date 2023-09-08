//
//  EmptyStateDrawer.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 07.09.2023.
//

import UIKit

final class EmptyStateDrawer: iCellDrawer {
	func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		tableView.register(EmptyStateCell.self, forCellReuseIdentifier: EmptyStateCell.cellIdentifier())
		return tableView.dequeueReusableCell(withIdentifier: EmptyStateCell.cellIdentifier(), for: indexPath)
	}

	func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any?, at indexPath: IndexPath?) {
		guard let cell = cell as? EmptyStateCell, let cellVM = item as? EmptyStateCellModel  else {
			return
		}

		cell.setEmptyStateImage(image: cellVM.emptyState.emptyImage)
		cell.setEmptyStateDescription(text: cellVM.emptyState.description)
	}
}
