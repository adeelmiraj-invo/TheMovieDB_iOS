//
//  ReelsContainerView.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import SwiftUI

struct ReelsContainerView: View {
    
    @State var movies: [Media]
    let itemIndex: Int
    @Binding var isPresented: Bool
    
    var body: some View{
        ZStack {
            MovieDetailPageView(movies: self.$movies, selectedItemIndex: .constant(itemIndex))
            
            VStack(alignment: .trailing) {
                HStack(alignment: .top) {
                    Spacer()
                    
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .colorMultiply(.red)
                    }
                    .frame(width: 50, height: 50)
                    .shadow(color: .white, radius: 4, x: 0, y: 0)
                }
                .padding(20)
                
                Spacer()
            }
            .padding(.top, 20)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}
