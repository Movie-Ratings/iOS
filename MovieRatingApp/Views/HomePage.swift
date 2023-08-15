//
//  HomePage.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/14/23.
//

import Foundation
import SwiftUI

struct HomePage : View {
    
    @EnvironmentObject var app : AppState
    @EnvironmentObject var manager : Manager
    
    var body : some View {
        VStack {
            ForEach(manager.movies) {movie in
                MovieView(movie : movie)
            }
        }
    }
}
