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
        Group { //Header
            HStack {
                Text("Popular").bold()
                Spacer()
            }
            Rectangle().frame(width : .infinity, height : 1)
        }
        Group { //Movie Information
            ScrollView {
                VStack {
                    ForEach(manager.movies) {movie in
                        MovieView(movie : movie).padding()
                    }
                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    
    static let manager = Manager()
    
    @State static var loaded = false
    
    static var previews: some View {
        
        VStack {
            if(loaded) {
                HomePage().environmentObject(AppState()).environmentObject(manager)
            }
        }.onAppear() {
            manager.load() {
                loaded = true
            }
        }
    }
}
