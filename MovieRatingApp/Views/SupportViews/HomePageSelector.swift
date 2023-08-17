//
//  HomePageSelector.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/17/23.
//

import Foundation
import SwiftUI

struct HomePageSelector : View {
    
    @EnvironmentObject var selection : HomePageSelection
    
    var body : some View {
        
        HStack {
            RoundedRectangleWithText(text : HomePageSelection.POPULAR).padding().environmentObject(selection)
            RoundedRectangleWithText(text : HomePageSelection.GENRE).padding().environmentObject(selection)
        }
        .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.blue, lineWidth: 2))
    }
}

struct RoundedRectangleWithText: View {
    
    @EnvironmentObject var selection : HomePageSelection
    
    var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .padding()
                .background(
                    self.text == selection.selection ? RoundedRectangle(cornerRadius: 50).fill(Color.blue.opacity(0.2)) : RoundedRectangle(cornerRadius: 50).fill(Color.white.opacity(0.2))
                )
        }.onTapGesture {
            selection.selection = text
        }
    }
}
