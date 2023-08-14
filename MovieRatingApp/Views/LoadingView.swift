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
    
    
    var body : some View {
        VStack {
            Text("Loading ...")
        }.onAppear(perform : {
            print("Changing app state")
            app.state = AppState.LOGIN
        })
    }
}
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView().environmentObject(AppState())
    }
}
