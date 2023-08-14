//
//  ContentView.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var app : AppState
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
        ContentView().environmentObject(AppState())
    }
}

class AppState : ObservableObject {
    
    public static let LOADING = -1
    public static let LOGIN = 0
    public static let HOME_PAGE = 1
    
    @Published var state : Int
    
    
    public func login(username : String, completion : @escaping (Bool) -> ()) {
        APIHelper.login(username : username) { value in
            completion(value)
        }
    }
    init() {
        self.state = AppState.LOADING
    }
    
    
    
}
