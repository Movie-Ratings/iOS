//
//  MovieDetailView.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/15/23.
//

import Foundation
import SwiftUI


struct MovieDetailView : View {
    
    @EnvironmentObject var current : AppState
    @EnvironmentObject var manager : Manager
    
    @StateObject var imageLoader = ImageLoader()
    
    var movie : Movie
    
    var body : some View {
        VStack {
            Group { //Header Information
                VStack {
                    HStack{
                        Image(systemName : "chevron.backward").onTapGesture {
                            current.state = AppState.HOME_PAGE
                        }.foregroundColor(Color.blue)
                        Text(movie.title).bold()
                        Spacer()
                    }.padding()
                    Rectangle().frame(width : .infinity, height : 1)
                }
            }
            Group {
                ScrollView {
                    if let image = imageLoader.image {
                        Image(uiImage: image).resizable().frame(width : 250, height: 450).cornerRadius(50)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 50).foregroundColor(Color(uiColor: UIColor.lightGray))
                        Text(movie.overview).italic().padding().foregroundColor(Color.white)
                    }
                }
            }
            
            Spacer()
        }.onAppear() {
            imageLoader.loadImage(from : movie.posterURL()!)
        }
    }
    
    init(movie : Movie) {
        self.movie = movie
    }
}


struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.example()).environmentObject(AppState()).environmentObject(Manager())
    }
}
