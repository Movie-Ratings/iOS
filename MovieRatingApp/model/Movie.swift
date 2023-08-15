//
//  Movie.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/14/23.
//

import Foundation

class Movie : Decodable, Identifiable {
    
    var id : Int
    var title : String
    var rating : Rating?
    var comments : [Comment]?
    var overview : String
    
    var poster_path : String
    var backdrop_path : String
    var release_date : String
    
    init(id: Int, title: String, rating: Rating, comments: [Comment], overview: String, poster_path: String, backdrop_path: String, release_date: String) {
        self.id = id
        self.title = title
        self.rating = rating
        self.comments = comments
        self.overview = overview
        self.poster_path = poster_path
        self.backdrop_path = backdrop_path
        self.release_date = release_date
    }
}
