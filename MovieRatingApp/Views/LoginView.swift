//
//  LoginView.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/12/23.
//

import Foundation
import SwiftUI

struct LoginView : View {
    
    @EnvironmentObject var app : AppState
    
    @State var username : String = ""
    
    var body : some View {
        VStack {
            TextField("Username", text : $username).padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            
            Button("OK") {
                app.login(username : username.lowercased()) { value in
                    if(value) {
                        print("SUCCESS")
                    }
                    else {
                        print("NOT LOGGED IN")
                    }
                }
            }
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AppState())
    }
}
