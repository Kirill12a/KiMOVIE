//
//  MovieCreditsResponseModel.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation

struct MovieCreditsResponseModel: Codable {
	let id: Int?
	let cast, crew: [MovieCastMemberResponseModel]?
}

// MARK: - Cast
struct MovieCastMemberResponseModel: Codable {
	let adult: Bool?
	let gender, id: Int?
	let knownForDepartment: CastMemberDepartment?
	let name, originalName: String?
	let popularity: Double?
	let profilePath: String?
	let castID: Int?
	let character, creditID: String?
	let order: Int?
	let department: CastMemberDepartment?
	let job: String?

	enum CodingKeys: String, CodingKey {
		case adult, gender, id
		case knownForDepartment = "known_for_department"
		case name
		case originalName = "original_name"
		case popularity
		case profilePath = "profile_path"
		case castID = "cast_id"
		case character
		case creditID = "credit_id"
		case order, department, job
	}
}

enum CastMemberDepartment: String, Codable {
	case acting = "Acting"
	case art = "Art"
	case camera = "Camera"
	case costumeMakeUp = "Costume & Make-Up"
	case creator = "Creator"
	case crew = "Crew"
	case directing = "Directing"
	case editing = "Editing"
	case lighting = "Lighting"
	case production = "Production"
	case sound = "Sound"
	case visualEffects = "Visual Effects"
	case writing = "Writing"
}
