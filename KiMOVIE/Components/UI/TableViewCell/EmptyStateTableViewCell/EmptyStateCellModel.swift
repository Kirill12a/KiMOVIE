//
//  EmptyStateCellModel.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 07.09.2023.
//

import Foundation

final class EmptyStateCellModel {
	var emptyState: EmptyState

	init(emptyState: EmptyState) {
		self.emptyState = emptyState
	}
}

extension EmptyStateCellModel: iDrawerItem {
	var cellDrawer: iCellDrawer {
		return EmptyStateDrawer()
	}
}
