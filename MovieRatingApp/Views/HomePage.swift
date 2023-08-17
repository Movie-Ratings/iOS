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
    
    @StateObject var selection : HomePageSelection = HomePageSelection()
    
    var body : some View {
        
        VStack {
            Group {
                HomePageSelector().environmentObject(selection)
            }
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
                            if(movie !== manager.movies[0]) {
                                Rectangle().frame(width: .infinity, height: 1).padding()
                            }
                            MovieView(movie : movie).padding()
                        }
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
            HomePage().environmentObject(AppState()).environmentObject(manager)

        }.onAppear() {
            manager.load() { succces in
                loaded = succces
            }
        }
    }
}

/**
 A View which displays a Loading message along with a ProgressView (a loading icon).
 
 
 */
struct LoadingIcon : View {
    
    @State private var isLoading = true
    @State private var showError = false
    private var time : Int
    var body : some View {
        VStack {
            if isLoading {
                // Show loading icon view
                ProgressView("Loading...")
            } else if showError {
                // Show error message view
                VStack {
                    Image(systemName : "gear.badge.xmark").resizable().frame(width:100, height:100).padding()
                    Text("The server took too long to respond.").padding()
                }.padding()
            }
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 30, repeats: false) { _ in
                isLoading = false
                showError = true
            }
        }
    }
    
    /**
            Initalizes a LoadingIcon instance with a timer of *time* seconds. After *time* seconds, an error message appears.
     */
    init(time : Int) {
        self.time = time
    }
    /**
     Initalizes a LoadingIcon instance with a timer of *30* seconds. After *30* seconds, an error message appears.
     */
    init() {
        self.time = 30
    }
}

class HomePageSelection : ObservableObject {
    static let POPULAR = "Popular"
    static let GENRE = "Genre"
    static let NONE = "N/A"
    
    @Published var selection : String
    
    init() {
        selection = HomePageSelection.NONE
    }
}
