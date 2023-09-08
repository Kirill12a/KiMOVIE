//
//  BaseViewController.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 07.09.2023.
//

import UIKit
import Foundation
import ProgressHUD

protocol iBaseViewDisplayLogic {
 // засунуть сюдым
}

class BaseViewController: UIViewController, iBaseViewDisplayLogic {

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = Constants.Styles.backGroundColor
	}


	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

	func showSpinner() {
		ProgressHUD.show("Loading")
	}

	func hideSpinner() {
		ProgressHUD.dismiss()
	}
}
