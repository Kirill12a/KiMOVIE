//
//  MovieCollectionViewCell.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 07.09.2023.
//

import UIKit


final class MovieCollectionViewCell: UICollectionViewCell, iGetCollectionIdentifier {

	//MARK: - Views

	private lazy var posterImageView: CustomImageView = {
		let imageView = CustomImageView()
		imageView.backgroundColor = Constants.Styles.mainColor
		imageView.layer.cornerRadius = 5
		imageView.clipsToBounds = true
		return imageView
	}()

	private let movieTitleLabel : UILabel = {
		let titleLabel = UILabel()
		titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
		titleLabel.textColor = Constants.Styles.textInfoColor
		return titleLabel
	}()

	//MARK: - Local methods

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.contentView.backgroundColor = .clear
		self.backgroundColor = .clear
		addSubview(posterImageView)
		addSubview(movieTitleLabel)
		setupViewsConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		posterImageView.image = nil
		movieTitleLabel.text = nil
	}

	private func setupViewsConstraints(){
		posterImageView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
			make.height.equalTo(130)
			make.width.equalTo(90)
		}

		movieTitleLabel.snp.makeConstraints { (make) in
			make.left.right.bottom.equalTo(posterImageView)
		}
	}

	// MARK: - Public draw methods

	func setMovieTitle(title: String){
		self.movieTitleLabel.text = title
	}

	func setMoviePosterImage(url: String, placeHolder: UIImage?){
		self.posterImageView.contentMode = .scaleAspectFill
		self.posterImageView.loadImageUsingUrlString(urlString: url, placeHolderImage: placeHolder)
	}

	func setDefaultPosterImage(placeholder: UIImage?){
		self.posterImageView.contentMode = .scaleAspectFit
		self.posterImageView.image = placeholder
	}
}
