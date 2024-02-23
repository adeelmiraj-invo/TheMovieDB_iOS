//
//  MoviesViewModel.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import SwiftUI
import Combine

class MoviesViewModel: ObservableObject {
    
    @Published
    private(set) var movies = [Media]()
    
    private var responseObject: ResponseObject<[Media]>!
    private var cancellables = [AnyCancellable]()
    var selectedIndex: Int?
    
    func fetchMovies() {
        let pageNumber: Int = responseObject == nil ? 1 : responseObject.page + 1
        MoviesService.fetchNowPlaying(pageNumber: pageNumber, pageSize: 20)
            .receive(on: DispatchQueue.main)
            .sink { result in
                if case let .failure(error) = result {
                    print(error)
                }
            } receiveValue: { [unowned self] response in
                if response.page == 1 {
                    responseObject = response
                    movies = response.results
                } else {
                    let mediaArray = responseObject.results + response.results
                    responseObject = ResponseObject<[Media]>(page: response.page, results: mediaArray, totalPages: response.totalPages, totalResults: response.totalResults)
                    movies = mediaArray
                }
            }
            .store(in: &cancellables)
    }
}
