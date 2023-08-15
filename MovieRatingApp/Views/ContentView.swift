//
//  ContentView.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/12/23.
//

import SwiftUI

//TO DO : (1) Implement displaying the poster image for each movie.
//        (2) Make it so you can click on a movie and go into details about it
//        (3) Once in details, be able to rate and make comments regarding the movie -- this should send information to the API to reflect changes.

struct ContentView: View {
    
    @EnvironmentObject var app : AppState
    @EnvironmentObject var manager : Manager
    
    var body: some View {
        VStack {
            switch(app.state) {
            case AppState.LOGIN : LoginView()
            case AppState.LOADING : LoadingView()
            case AppState.HOME_PAGE : HomePage()
            default : LoadingView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppState()).environmentObject(Manager())
    }
}
