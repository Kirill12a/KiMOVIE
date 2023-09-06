//
//  MovieListResponseModel.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation

struct MovieListResponseModel: Decodable {

	let page: Int?
	let results: [MovieResultResponseModel]?
	let totalPages, totalResults: Int?

	enum CodingKeys: String, CodingKey {
		case page, results
		case totalPages = "total_pages"
		case totalResults = "total_results"
	}

	init(page: Int, results: [MovieResultResponseModel], totalPages: Int, totalResults: Int){
		self.page = page
		self.results = results
		self.totalPages = totalPages
		self.totalResults = totalResults
	}

}
