//
//  User.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/12/23.
//

import Foundation

public class User : Codable {
    var id : UUID
    var username : String
    
    init(id : UUID, username : String) {
        self.id = id;
        self.username = username
    }
    
    func description() -> String {
        return "(\(id) | \(username))"
    }
    
}
