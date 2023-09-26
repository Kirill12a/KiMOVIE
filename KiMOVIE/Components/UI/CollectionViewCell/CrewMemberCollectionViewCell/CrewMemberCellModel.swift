//
//  CrewMemberCellModel.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 26.09.2023.
//

import Foundation
final class CrewMemberCellModel {

	var memberName: String
	var roleInMovie: String
	var imageUrl: String?

	init(castVM: MovieCastMemberViewModel){
		self.memberName = castVM.name
		self.roleInMovie = castVM.characterPlayed
		self.imageUrl = castVM.imageUrl
	}

}

// MARK: - DrawerItemProtocol -

extension CrewMemberCellModel: iCollectionDrawerItem {
	var collectionDrawer: iCollectionDrawer {
		return CrewMemberDrawer()
	}
}
