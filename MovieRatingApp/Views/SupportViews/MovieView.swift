//
//  MovieView.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/14/23.
//

import Foundation
import SwiftUI

struct MovieView : View {
    
    var movie : Movie
    
    var body : some View {
        VStack {
            Text(movie.title)
            Text(movie.overview)
        }
    }
    
    init(movie : Movie) {
        self.movie = movie
    }
}
