//
//  LoadingView.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/12/23.
//

import Foundation
import SwiftUI

struct LoadingView : View {
    @EnvironmentObject var app : AppState
    @EnvironmentObject var manager : Manager
    
    
    var body : some View {
        VStack {
            Text("Loading ...")
        }.onAppear(perform : {
            manager.load() {
                app.state = AppState.LOGIN
            }
        })
    }
}
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView().environmentObject(AppState()).environmentObject(Manager())
    }
}
