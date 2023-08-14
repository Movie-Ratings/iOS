//
//  Rating.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/14/23.
//

import Foundation
/**
    This class represents a Rating which can be used either on a Movie or Comment type.
 */

public class Rating : Comparable, Decodable {
    
    /**
        The total number of stars given to this rating.
     */
    private var stars : Double
    /**
            The total number of ratings submitted by users.
     */
    private var ratings : Double
    
    /**
        This method returns the rating of this instance.
     */
    
    public func rating() -> Double {
        return stars/ratings
    }
    /**
            This method inserts the given rating as a rating into this instance.
     
            The rating must be between 0 and 5 incluive.
     */
    
    public func rate(rating : Int) {
        if(rating >= 0 && rating <= 5) {
            self.stars += (Double)(rating)
            self.ratings += 1
        }
    }
    init() {
        self.stars = 0
        self.ratings = 0
    }
}

public func < (lhs : Rating, rhs : Rating) -> Bool {
    return lhs.rating() < rhs.rating()
}

public func == (lhs: Rating, rhs : Rating) -> Bool {
    return lhs.rating() == rhs.rating()
}
