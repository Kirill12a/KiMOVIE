//
//  TableViewCellProtocols.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import UIKit

protocol iGetCellIdentifier {
	static func cellIdentifier() -> String
}

extension iGetCellIdentifier where Self: UITableViewCell {
	static func cellIdentifier() -> String {
		return String(describing: self)
	}
}

protocol iCellDrawer {
	func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any?, at indexPath: IndexPath?)
}

extension iCellDrawer {
	func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath? = nil) {
		drawCell(cell, withItem: item, delegate: delegate, at: indexPath)
	}
}

protocol iDrawerItem {
	var cellDrawer: iCellDrawer { get }
}
