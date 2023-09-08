//
//  MainViewModel.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import UIKit

class MainViewModel {
	var movieCategories: [iDrawerItem] = []

	init(movieCategories: [iDrawerItem]) {
		self.movieCategories = movieCategories
	}
}
