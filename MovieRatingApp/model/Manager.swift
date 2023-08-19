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
    
    /**
        Loads data from the backend into a model accessble by the front end.
     */
    public func load(completion : @escaping (Bool) -> ()) {
        APIHelper.insertMovies(into: self) { result in
            completion(result)
        }
    }
    
    public func loadPopular(completion : @escaping (Bool) -> ()) {
        APIHelper.insertPopular(into : self) {result in
            completion(result)
        }
    }
    
    init() {
        popular = [Movie]()
        search_results = [Movie]()
    }
}
