//
//  MovieDetailInteractor.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 07.09.2023.
//

import UIKit

protocol iMovieDetailBusinessLogic {
	func fetchMovieDetail()
}

protocol iMovieDetailDataStore {
	var movieIdentifier: Int! {get set}
	var castingMembers:  [ReviewResultResponseModel] { get }
	var movieDetail: MovieDetailResponseModel? {get}

}

