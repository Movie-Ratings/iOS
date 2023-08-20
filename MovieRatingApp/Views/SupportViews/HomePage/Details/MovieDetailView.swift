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
    @StateObject var popover_communicator = PopoverCommunicator()
    
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
                        AddToMyListButton(movie : movie).environmentObject(manager).environmentObject(popover_communicator)
                    }.padding()
                }
            }
            Group {
                if(popover_communicator.addToListIssue) {
                    HStack {
                        Text("Cannot add to list, the movie is already on your list!")
                        Image(systemName: "exclamationmark.circle.fill").onTapGesture {
                            popover_communicator.addToListIssue = false
                        }
                    }
                }
            }
            Rectangle().frame(width : .infinity, height : 1)
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

struct AddToMyListButton : View {
    
    @EnvironmentObject var manager : Manager
    @EnvironmentObject var popover_communicator : PopoverCommunicator
    var movie : Movie
    
    var body : some View {
        Image(systemName : "plus.circle.fill").resizable().frame(width : 30, height : 30).foregroundColor(Color.red).onTapGesture {
            manager.addToMyList(movie: movie) {result in
                popover_communicator.addToListIssue = !result
            }
        }
    }
}

/**
 A PopoverCommunicator which is used to communicate whether or not a particular pop up should appear in the UI.
 */
class PopoverCommunicator : ObservableObject {
    
    /**
            This field is used to communicate when there is an issue with adding a movie to the list.
     */
    @Published var addToListIssue : Bool
    
    init() {
        addToListIssue = false
    }
    
}


struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.example()).environmentObject(AppState()).environmentObject(Manager())
    }
}
