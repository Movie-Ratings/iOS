//
//  Manager.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/14/23.
//

import Foundation

class Manager : ObservableObject {
    
    @Published var movies : [Movie]
    
    @Published var selectedMovie : Movie?
    
    public func insertMovies(movies : [Movie]) {
        self.movies = movies
    }
    
    /**
        Loads data from the backend into a model accessble by the front end.
     */
    public func load(completion : @escaping (Bool) -> ()) {
        APIHelper.insertMovies(into: self) { result in
            completion(result)
        }
    }
    
    init() {
        movies = [Movie]()
    }
}
