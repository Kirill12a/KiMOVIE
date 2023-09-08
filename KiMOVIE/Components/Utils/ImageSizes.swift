//
//  ImageSizesEnums.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation

protocol iPictureSize {
	var sizeUrlString: String {get}
	func getFullUrlForSize(endpoint: String)->String
}

extension iPictureSize {
	func getFullUrlForSize(endpoint: String)->String{
		return NetworkEndpoints.BaseURL.imagesBaseUrl + sizeUrlString + endpoint
	}
}

enum MoviePosterSizes: iPictureSize {

	case small
	case medium
	case big

	var sizeUrlString: String {
		switch self{
		case .small:
			return "w92"
		case .medium:
			return "w342"
		case .big:
			return "w500"
		}
	}

}

enum BackdropImageSizes: iPictureSize{

	case small
	case medium
	case big

	var sizeUrlString: String {
		switch self{
		case .small:
			return "w300"
		case .medium:
			return "w780"
		case .big:
			return "w1280"
		}
	}

}

enum ProfilePictureSizes: iPictureSize {
	case small
	case medium
	case big
	case original

	var sizeUrlString: String {
		switch self {

		case .small:
			return "w45"
		case .medium:
			return "w185"
		case .big:
			return "h632"
		case .original:
			return "original"
		}
	}

}
