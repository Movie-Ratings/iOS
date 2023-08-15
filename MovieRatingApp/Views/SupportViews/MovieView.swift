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
    
    var movie : Movie
    
    @StateObject private var imageLoader = ImageLoader()
    
    
    var body : some View {
        VStack {
            Text(movie.title)
            Text(movie.overview)
            if let image = imageLoader.image {
                Image(uiImage : image)
            }
            else {
                Image(systemName : "globe")
            }
        }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1)).onAppear() {
            if let url = movie.posterURL() {
                imageLoader.loadImage(from : url)
            }
        }
    }
    
    init(movie : Movie) {
        self.movie = movie
    }
}

class ImageLoader : ObservableObject {
    
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
