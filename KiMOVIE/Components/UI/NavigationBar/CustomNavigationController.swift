//
//  CustomNavigationController.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import UIKit

class CustomNavigationController: UINavigationController {

	var textAttributes: [NSAttributedString.Key : UIColor] = [:]

	override func viewDidLoad() {
		navigationContoolerSetupStyle()
	}

	private func navigationContoolerSetupStyle() {
		self.navigationBar.barStyle = Constants.Styles.tabbarStyleColor
		self.navigationBar.tintColor = Constants.Styles.mainColor
		textAttributes = [NSAttributedString.Key.foregroundColor: Constants.Styles.mainColor]
		self.navigationBar.titleTextAttributes = textAttributes
		self.navigationBar.isTranslucent = false
	}
}
