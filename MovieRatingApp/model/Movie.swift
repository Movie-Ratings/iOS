//
//  Movie.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/14/23.
//

import Foundation

public class Movie {
    
    var id : Int
    var title : String
    var rating : Rating
    var comments : [Comment]
    var overview : String
    
    var poster_path : String
    var backdrop_path : String
    var release_dat : String
    
    init(id: Int, title: String, rating: Rating, comments: [Comment], overview: String, poster_path: String, backdrop_path: String, release_dat: String) {
        self.id = id
        self.title = title
        self.rating = rating
        self.comments = comments
        self.overview = overview
        self.poster_path = poster_path
        self.backdrop_path = backdrop_path
        self.release_dat = release_dat
    }
}
