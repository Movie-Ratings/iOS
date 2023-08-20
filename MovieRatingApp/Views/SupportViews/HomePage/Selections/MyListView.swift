//
//  MyListView.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/20/23.
//

import Foundation
import SwiftUI


struct MyListView : View {
    
    @EnvironmentObject var manager : Manager
    
    var body : some View {
        VStack {
            ForEach(manager.my_list) { movie in
                MovieView(movie: movie)
            }
        }
    }
}
