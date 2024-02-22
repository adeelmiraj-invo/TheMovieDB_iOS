//
//  ContentView.swift
//  TheMovieDB
//
//  Created by Admin on 21/02/2024.
//

import SwiftUI

struct ContentView: View {
    private var data  = Array(1...20)
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(String(item))
                        .frame(width: 150, height: 150, alignment: .center)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
            
        } .padding()
    }
}

#Preview {
    ContentView()
}
