//
//  PopularView.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/19/23.
//

import Foundation
import SwiftUI

struct PopularView : View {
    
    @EnvironmentObject var manager : Manager
    @EnvironmentObject var current : AppState
    
    var body : some View {
        
        VStack {
            ForEach(manager.popular) {movie in
//                if(movie !== manager.movies[0]) {
//                    Rectangle().frame(width: .infinity, height: 1).padding()
//                }
                MovieView(movie : movie).padding().environmentObject(current).environmentObject(manager)
            }
        }.onAppear() {
            manager.loadPopular() { result in }
        }
    }
}
