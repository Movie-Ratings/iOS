//
//  AppState.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/14/23.
//

import Foundation

class AppState : ObservableObject {
    
    public static let LOADING = -1
    public static let LOGIN = 0
    public static let HOME_PAGE = 1
    
    @Published var state : Int
    
    
    public func login(username : String, completion : @escaping (Bool) -> ()) {
        APIHelper.login(username : username) { value in
            completion(value)
        }
    }
    init() {
        self.state = AppState.LOADING
    }
}
