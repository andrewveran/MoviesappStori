//
//  Constants.swift
//  MoviesApp
//
//  Created by Andres Leal on 4/26/21.
//  Copyright © 2021 Andres Leal. All rights reserved.
//

import Foundation

struct Constants {
    static let apiKey = "?api_key=1762920628188c0cf45ad3eb72e6da6d"
    
    struct URL {
        static let main = "https://api.themoviedb.org/"
        static let urlImages = "https://image.tmdb.org/t/p/w200"
    }
    
    struct EndPoints {
        static let urlListPopularMovies = "3/movie/popular"
        static let urlDetailMovie = "3/movie/"
    }
}
