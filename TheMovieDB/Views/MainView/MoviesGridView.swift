//
//  MoviesGridView.swift
//  TheMovieDB
//
//  Created by Admin on 21/02/2024.
//

import SwiftUI

struct MoviesGridView: View {
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    @StateObject private var viewModel = MoviesViewModel()
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                ForEach(viewModel.movies, id: \.self) { item in
                    Text(String(item.originalTitle))
                        .frame(width: 150, height: 150, alignment: .center)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
        }.padding()
        .onAppear {
            viewModel.fetchMovies()
        }
    }
}

#Preview {
    MoviesGridView()
}
