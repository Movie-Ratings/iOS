//
//  Manager.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/14/23.
//

import Foundation

class Manager : ObservableObject {
    
    @Published var selectedMovie : Movie?
    
    @Published var popular : [Movie]
    
    @Published var search_results : [Movie]
    
    @Published var my_list : [Movie]
    
    @Published var username : String
    
    /**
        Loads data from the backend into a model accessble by the front end.
     */
//    public func load(completion : @escaping (Bool) -> ()) {
//        APIHelper.insertMovies(into: self) { result in
//            completion(result)
//        }
//    }
    
    /// Invokes an API request to load the most popular movies from TMDB. These movies populate the internal field *popular*
    /// - Parameter completion: <#completion description#>
    public func loadPopular(completion : @escaping (Bool) -> ()) {
        APIHelper.insertPopular(into : self) {result in
            completion(result)
        }
    }
    
    /**
            Inserts the given list of Movie as the internal reference for popular movies. This will overwrite the previously most popular movies.
     */
    public func insertPopular(movies : [Movie]) {
        self.popular = movies
    }
    
    public func addToMyList(movie : Movie, completion : @escaping (Bool) -> ()) {
        APIHelper.addToMyList(movie : movie, username : username) {result in
            completion(result)
        }
    }
    
    public func set_username(username : String, completion : @escaping () -> ()) {
        self.username = username
        APIHelper.getMyList(username : username) {movies in
            if let my_movies = movies {
                self.my_list = my_movies
            }
            completion()
        }
    }
    
    init() {
        popular = [Movie]()
        search_results = [Movie]()
        my_list = [Movie]()
        self.username = ""
    }
}
