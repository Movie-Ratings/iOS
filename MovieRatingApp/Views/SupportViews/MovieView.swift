//
//  MovieView.swift
//  MovieRatingApp
//
//  Created by Nick Thacke on 8/14/23.
//

import Foundation
import SwiftUI
import Combine

struct MovieView : View {
    
    /**
     The Movie that this View is showing.
     */
    var movie : Movie
    
    /**
     The ImageLoader which is used to load and store the image of this movie.
     */
    @StateObject private var imageLoader = ImageLoader()
    
    /**
     The current AppState.
     */
    @EnvironmentObject var current : AppState
    
    var body : some View {
        VStack {
            if let image = imageLoader.image {
                Image(uiImage : image).resizable().frame(width : 250, height : 450).cornerRadius(50)
            }
            else {
                Image(systemName : "globe")
            }
            
        }.padding().onAppear() {
            if let url = movie.posterURL() {
                imageLoader.loadImage(from : url)
            }
        }
    }
    
    init(movie : Movie) {
        self.movie = movie
    }
}

/**
 This class is used to load images for a Movie.
 */
private class ImageLoader : ObservableObject {
    
    @Published var image : UIImage?
    
    func loadImage(from url: URL) {
            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .compactMap { UIImage(data: $0) }
                .receive(on: DispatchQueue.main)
                .sink { _ in } receiveValue: { [weak self] image in
                    self?.image = image
                }
                .store(in: &cancellables)
        }

    private var cancellables: Set<AnyCancellable> = []
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie : Movie.example()).environmentObject(AppState())
    }
}
