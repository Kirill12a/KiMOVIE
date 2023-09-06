//
//  NetworkParameters.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation

enum NetworkParameters {
	static let requestTimeOut = 4.0
	static let timeOutBetweenRetries = 1.0
	static let validationRange = 200..<300

	enum MovieDBApiKey {
		static let apiKEY = "api_key"
		static let keyValue = "ad0060e9a465d0c1b0b10595f16eadea"
	}

	enum Search {
		static let key = "query"
	}
}
