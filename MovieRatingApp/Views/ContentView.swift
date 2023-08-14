//
//  ContentView.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var app : AppState
    @EnvironmentObject var manager : Manager
    
    var body: some View {
        VStack {
            switch(app.state) {
            case AppState.LOGIN : LoginView()
            case AppState.LOADING : LoadingView()
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
