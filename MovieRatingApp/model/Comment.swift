//
//  Comment.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/14/23.
//

import Foundation

public class Comment : Comparable, Decodable {
    
    /**
            The user which made this comment
     */
    var user : User
    
    /**
            The rating of this comment.
     */
    
    var rating : Rating
    
    /**
            The actual comment.
     */
    
    var comment : String
    /**
     The movieID which this comment was made for.
     */
    
    var movieID : Int
    /**
     The ID of this comment.
     */
    
    var id : UUID
}

public func < (lhs: Comment, rhs: Comment) -> Bool {
    return lhs.rating.rating() < rhs.rating.rating()
}
public func == (lhs: Comment, rhs: Comment) -> Bool {
    return lhs.rating.rating() == rhs.rating.rating()
}
