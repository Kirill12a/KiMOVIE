//
//  CollectionViewCellProtocols.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 07.09.2023.
//

import UIKit

protocol iGetCollectionIdentifier {
	static func getCollectionIdentifier() -> String
}

extension iGetCollectionIdentifier where Self: UICollectionViewCell {
	static func getCollectionIdentifier() -> String {
		return String(describing: self)
	}
}

protocol iCollectionDrawer {
	func dequeueCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell

	func drawCollectionCell(_ collectionView: UICollectionViewCell, withItem item: Any)
}

protocol iCollectionDrawerItem {
	var collectionDrawer: iCollectionDrawer { get }
}
