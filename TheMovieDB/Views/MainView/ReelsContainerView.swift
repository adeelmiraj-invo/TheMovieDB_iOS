//
//  ReelsContainerView.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import SwiftUI

struct ReelsContainerView: View {
    
    @State var movies: [Media]
    @State var itemIndex: Int
    var body: some View{
        ZStack{
            MovieDetailPageView(movies: self.$movies, selectedItemIndex: .constant(itemIndex))
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}
