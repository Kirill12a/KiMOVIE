//
//  MovieCategoryTapProtocol.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 07.09.2023.
//

import Foundation

protocol iMovieCategoryTap: NSObject {
	func userDidSelectedElement(indexSelected: IndexPath, additionalInfo: Any?)
}
