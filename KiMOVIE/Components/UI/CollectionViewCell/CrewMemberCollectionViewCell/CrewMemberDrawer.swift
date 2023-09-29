//
//  CrewMemberDrawer.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 26.09.2023.
//

import UIKit

final class CrewMemberDrawer: iCollectionDrawer {

	func dequeueCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
		collectionView.register(CrewMemberCell.self, forCellWithReuseIdentifier: CrewMemberCell.getCollectionIdentifier())
		return collectionView.dequeueReusableCell(withReuseIdentifier: CrewMemberCell.getCollectionIdentifier(),
												  for: indexPath)
	}

	func drawCollectionCell(_ collectionView: UICollectionViewCell, withItem item: Any) {
		guard let cell = collectionView as? CrewMemberCell, let cellVM = item as? CrewMemberCellModel
		else {
			return
		}

		cell.setMemberName(name: cellVM.memberName)
		cell.setMemberRole(role: cellVM.roleInMovie)

		if let castImage = cellVM.imageUrl {
			cell.setMemberImage(url: castImage, placeHolderImage: UIImage.init(named: "userNotFound")?.withTintColor(Constants.Styles.mainColor))
		} else {
			cell.setPlaceholderImage(image: UIImage.init(named: "userNotFound")?.withTintColor(Constants.Styles.mainColor))
		}
	}
}
