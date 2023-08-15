//
//  Movie.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/14/23.
//

import Foundation

class Movie : Decodable, Identifiable {
        
    /**
     The ID of this Movie. This ID will be the same ID as TMDB's IDs
     */
    var id : Int
    /**
     The title of this movie.
     */
    var title : String
    
    /**
     The Rating that this movie has recevied from users.
     */
    var rating : Rating?
    /**
     The Comments that this movie has recevieved from users.
     */
    var comments : [Comment]?
    
    /**
     The overview of this movie. In other words, this is the description that a narrator says in the beginning of a trailer.
     */
    var overview : String
    
    /**
     The poster path to the movie's poster (the poster is the main image you see for a movie). This poster path is actually the path that you must specifiy in the URL to obtain the actual poster image.
     
        To access the poster, invoke the url :
     https://image.tmdb.org/t/p/w500/{poster_path}
     
        To see how this is done explicitly (i.e., the literal code), see the MovieView file under "Views -> Support Views"
     
     This field is kept internally private as accessing it directly from an instance is not as useful as simply invoking the posterURL() function, which returns back the URL of this movie to obtain the poster.
     
     This field should be maintained as a field for purposes relating to sending/receiving JSON data. When accessing an API to retrieve Movie data from, it is best to keep this field as the JSON data will contain a poster_path field.
     
        
     */
    private var poster_path : String
    
    /**
     The backdrop path to the movie's backdrop (the backdrop is an accopyming image that is not as seen as often as the poster).. This  path is actually the path that you must specifiy in the URL to obtain the actual poster image.
     
        To access the image invoke the url :
     https://image.tmdb.org/t/p/w1280/{backdrop_path}
     
     This field is kept internally private as accessing it directly from an instance is not as useful as simply invoking the backdropURL() function, which returns back the URL of this movie to obtain the poster.
     
     This field should be maintained as a field for purposes relating to sending/receiving JSON data. When accessing an API to retrieve Movie data from, it is best to keep this field as the JSON data will contain a backdrop_path field.
     */
    private var backdrop_path : String
    
    /**
            The release date of this movie.
     */
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
    
    func posterURL() -> String {
        return "https://image.tmdb.org/t/p/w500/\(poster_path)"
    }
    
    func backdropURL() -> String {
        return "https://image.tmdb.org/t/p/w1280/\(backdrop_path)"
    }
    
}
