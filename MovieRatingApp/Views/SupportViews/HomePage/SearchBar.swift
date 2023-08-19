//
//  SearchBar.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/18/23.
//

import Foundation
import SwiftUI

struct SearchBar : View {
    
    @State var text : String
    
    var body : some View {
        
        TextField("Search ... ", text : $text).padding().background(RoundedRectangle(cornerRadius: 50).fill(Color.gray.opacity(0.01))).overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.red, lineWidth: 2))
    }
    
    init() {
        self.text = ""
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}


