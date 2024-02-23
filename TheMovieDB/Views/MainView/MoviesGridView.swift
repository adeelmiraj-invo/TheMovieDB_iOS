//
//  MoviesGridView.swift
//  TheMovieDB
//
//  Created by Admin on 21/02/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviesGridView: View {
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    @StateObject private var viewModel = MoviesViewModel()
    @State private var isPresented: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: adaptiveColumn, spacing: 5) {
                    ForEach(Array(viewModel.movies.enumerated()), id: \.element.id) { index, item in
                        Button(action: {
                            viewModel.selectedIndex = index
                            isPresented = true
                        }) {
                            AnimatedImage(url: URL(string: item.posterImagePath),
                                          isAnimating: .constant(false))
                                .resizable()
                                .frame(width: geometry.size.width/2 - 5,
                                       height: geometry.size.width/2 - 5, alignment: .center)
                                .cornerRadius(10)
                                .font(.title)
                                .scaledToFill()
                        }
                    }
                }
            }.padding(.all, 5)
        }
        .onAppear {
            viewModel.fetchMovies()
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            ReelsContainerView(movies: viewModel.movies, itemIndex: viewModel.selectedIndex!, isPresented: $isPresented)
        })
    }
}

#Preview {
    MoviesGridView()
}

extension Int: Identifiable {
    public var id: Int { return self }
}
