//
//  MovieDetailView.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import Foundation
import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct MovieDetailView : View {
    @Binding var movies : [Media]
    
    var body: some View{
        VStack(spacing: 0){
            ForEach(0..<self.movies.count) { i in
                ZStack{
                        WebImage(url: URL(string: movies[i].posterImagePath), isAnimating: .constant(true))
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: -5)
                }
            }
        }
    }
}


struct MovieDetailPageView : UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
    }
    
    @Binding var movies : [Media]
    @Binding var selectedItemIndex: Int
    
    func makeUIView(context: Context) -> UIScrollView{
        
        let view = UIScrollView()
        
        let childView = UIHostingController(rootView: MovieDetailView(movies: self.$movies))
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((movies.count)))
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((movies.count)))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((movies.count)))
        let offset = UIScreen.main.bounds.height * CGFloat(selectedItemIndex)
        uiView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
        for i in 0..<uiView.subviews.count{
            uiView.subviews[i].frame = CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((movies.count)))
        }
    }
}
