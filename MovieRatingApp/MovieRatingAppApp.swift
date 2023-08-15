//
//  MovieRatingAppApp.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/12/23.
//

import SwiftUI

@main
struct MovieRatingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AppState()).environmentObject(Manager())
        }
    }
}
