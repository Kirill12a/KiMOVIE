//
//  MovieCollectionViewDrawer.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 07.09.2023.
//

import UIKit

final class MoviewCollectionViewDrawer: iCollectionDrawer {

	func dequeueCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
		collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.getCollectionIdentifier())

		return collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.getCollectionIdentifier(), for: indexPath)
	}

	func drawCollectionCell(_ collectionView: UICollectionViewCell, withItem item: Any) {
		guard let cell = collectionView as? MovieCollectionViewCell, let cellVM = item as? MovieCollectionViewCellModel
		else {
			return
		}

		cell.setMovieTitle(title: cellVM.movieTitle)

		if let posterURL = cellVM.moviePosterURL {
			cell.setMoviePosterImage(url: posterURL, placeHolder: UIImage.init(named: "moviePosterNotFound"))
		} else {
			cell.setDefaultPosterImage(placeholder: UIImage.init(named: "moviePosterNotFound"))
		}
	}
	
}
