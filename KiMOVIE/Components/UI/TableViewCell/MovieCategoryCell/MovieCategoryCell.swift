//
//  MovieCategoryCell.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 24.09.2023.
//

import UIKit
import SnapKit

class MovieCategoryCell: UITableViewCell, iGetCellIdentifier {

	private let categoryTitleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textColor = Constants.Styles.titleColor
		label.adjustsFontSizeToFitWidth = true
		label.numberOfLines = 1
		label.textAlignment = .left
		return label
	}()

	private let moviesCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		let collectionView = UICollectionView.init(frame: CGRect.init(), collectionViewLayout: layout)
		collectionView.backgroundColor = .clear
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.contentInset = UIEdgeInsets.init(top: 10, left: 20, bottom: 10, right: 20)
		return collectionView
	}()

	// MARK: - Variables

	private var collectionElements: [iCollectionDrawerItem] = []
	private weak var delegate: iMovieCategoryTap?
	private var categoryIdentifier: Any?

	// MARK: - Life Cycle

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.contentView.backgroundColor = .clear
		self.backgroundColor = .clear
		addSubview(categoryTitleLabel)
		addSubview(moviesCollectionView)
		setupCollectionView()
		setupViewsConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupCollectionView(){
		moviesCollectionView.delegate = self
		moviesCollectionView.dataSource = self
	}

	// MARK: - Constraints setup

	private func setupViewsConstraints(){

		categoryTitleLabel.snp.makeConstraints { (make) in
			make.left.right.equalToSuperview().offset(20)
			make.top.equalToSuperview().offset(10)
		}

		moviesCollectionView.snp.makeConstraints { (make) in
			make.left.right.bottom.equalToSuperview()
			make.top.equalTo(categoryTitleLabel.snp.bottom)
			make.height.equalTo(150)
		}
	}

	//MARK: -Public cell setup methods

	func setCategoryTitleLabelText(text: String) {
		categoryTitleLabel.text = text
	}

	func setCollectionElementsToShow(cells: [iCollectionDrawerItem]) {
		self.collectionElements = cells
		moviesCollectionView.reloadData()
	}

	func setTapDelegate(delegate: iMovieCategoryTap){
		self.delegate = delegate
	}

	func setCategoryIdentifier(additionalInfo: Any?){
		self.categoryIdentifier = additionalInfo
	}

	func setTitleTextSize(size: CGFloat){
		self.categoryTitleLabel.font = UIFont.boldSystemFont(ofSize: size)
	}

}

//MARK: - CollectionView management

extension MovieCategoryCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		collectionElements.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cellModel = collectionElements[indexPath.row]
		let drawer = cellModel.collectionDrawer
		let cell = drawer.dequeueCollectionCell(collectionView, indexPath: indexPath)
		drawer.drawCollectionCell(cell, withItem: cellModel)
		return cell
	}

	//we return the selected index and additional info to identify the table cell in case there are more than 1 (an enum can be used as an identifier for example)
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		delegate?.userDidSelectedElement(indexSelected: indexPath, additionalInfo: self.categoryIdentifier)
	}

}
