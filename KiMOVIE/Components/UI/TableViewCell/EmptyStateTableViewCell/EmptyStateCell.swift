//
//  EmptyStateCell.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 07.09.2023.
//

import UIKit

class EmptyStateCell: UITableViewCell, iGetCellIdentifier {

	private let emptyStateDescription: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .white
		label.textAlignment = .center
		return label
	}()

	private let emptyStateImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.tintColor = Constants.Styles.emptyStateImageTint
		return imageView
	}()

	private let stackView: UIStackView = {
		let stack = UIStackView()
		stack.alignment = .center
		stack.axis = .vertical
		stack.spacing = 15
		stack.distribution = .equalSpacing
		return stack
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
		setupViewsConstraints()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		emptyStateDescription.text = nil
		emptyStateImageView.image = nil
	}


	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {
		self.backgroundColor = .clear
		self.contentView.backgroundColor = .clear
	}

	// MARK: - Constraints setup

	private func setupViewsConstraints() {
		self.addSubview(stackView)

		stackView.addArrangedSubview(emptyStateImageView)
		stackView.addArrangedSubview(emptyStateDescription)

		stackView.snp.makeConstraints { make in
			make.left.right.equalToSuperview().inset(20)
			make.centerX.centerY.equalToSuperview()
		}

		emptyStateDescription.snp.makeConstraints { make in
			make.left.right.equalToSuperview()
		}

		emptyStateImageView.snp.makeConstraints { make in
			make.width.equalTo(100)
		}
	}

	func setEmptyStateImage(image: UIImage?) {
		self.emptyStateImageView.image = image
	}

	func setEmptyStateDescription(text: String) {
		self.emptyStateDescription.text = text
	}

}
