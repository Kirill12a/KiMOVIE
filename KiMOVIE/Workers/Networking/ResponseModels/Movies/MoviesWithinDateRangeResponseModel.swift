//
//  MoviesWithinDateRangeResponseModel.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation

struct MoviesWithinDateRangeResponseModel: Decodable {
	let dates: DatesResponseModel?
	let page: Int?
	let results: [MovieResultResponseModel]?
	let totalPages, totalResults: Int?

	enum CodingKeys: String, CodingKey {
		case dates, page, results
		case totalPages = "total_pages"
		case totalResults = "total_results"
	}
}


// MARK: - Dates
struct DatesResponseModel: Codable {
	let maximum, minimum: String?
}
