//
//  NetworkEndpoints.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 06.09.2023.
//

import Foundation

enum NetworkEndpoints {

	enum BaseURL {
		static let moviesBaseUrl = "https://api.themoviedb.org/3/"
		static let imagesBaseUrl = "https://image.tmdb.org/t/p/"
	}

	enum MoviePath {
		static let popularMovies = "movie/popular"
		static let nowPlayingMovies = "movie/now_playing"
		static let topRatedMovies = "movie/top_rated"
		static let upcomingMovies = "movie/upcoming"

		static let movieDetail = "movie/%@"
		static let movieCredits = "movie/%@/credits"
		static let movieReviews = "movie/%@/reviews"
	}

	enum CastingPath{
		static let castingImages = "person/%@/images"
		static let castDetail = "person/%@"
		static let moviesOfCast = "person/%@/movie_credits"
	}

	enum SearchPath{
		static let movieSearch = "search/movie"
	}
}
