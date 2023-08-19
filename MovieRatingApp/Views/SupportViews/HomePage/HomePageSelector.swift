//
//  HomePageSelector.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/17/23.
//

import Foundation
import SwiftUI

/**
 This struct is a HomePageSelector, wherein options are displayed to the user. These options are presented in a Horizontal fashion, displaying two items at a time, with the user being able to swipe through the options to show more.
 */
struct HomePageSelector : View {
    
    @EnvironmentObject var selection : HomePageSelection
    
    var body : some View {
        HStack {
                ScrollView(.horizontal) {
                    HStack {
                        RoundedRectangleWithText(text : HomePageSelection.POPULAR).padding().environmentObject(selection)
                        RoundedRectangleWithText(text : HomePageSelection.GENRE).padding().environmentObject(selection)
                        RoundedRectangleWithText(text : HomePageSelection.MY_LIST).padding().environmentObject(selection)
                        RoundedRectangleWithText(text : HomePageSelection.WATCHED).padding().environmentObject(selection)
                        RoundedRectangleWithText(text : HomePageSelection.SEARCH).padding().environmentObject(selection)
                    }
                }.scrollIndicators(ScrollIndicatorVisibility.never)
            }
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
                    self.text == selection.selection ? RoundedRectangle(cornerRadius: 50).fill(Color.red) : RoundedRectangle(cornerRadius: 50).fill(Color.clear)
                ).foregroundColor(self.text == selection.selection ? Color.white : Color.black)
        }.onTapGesture {
            selection.selection = text
        }
    }
}

class HomePageSelection : ObservableObject {
    static let POPULAR = "Popular"
    static let GENRE = "Genre"
    static let MY_LIST = "My List"
    static let WATCHED = "Watched"
    static let SEARCH = "Search"
    
    @Published var selection : String
    
    init() {
        selection = HomePageSelection.POPULAR
    }
}
