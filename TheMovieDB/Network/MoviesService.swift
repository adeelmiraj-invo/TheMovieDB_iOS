//
//  MoviesService.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import Foundation
import Combine

class MoviesService {
    func fetchNowPlaying(pageNumber: Int, pageSize: Int) -> AnyPublisher<ResponseObject<[Media]>, CommonError> {
        let request = NetworkRequest(service: Services.nowPlaying(page: UInt(pageNumber), pageSize: UInt(pageSize)), method: .get)
        return APIClient.executeRequest(request: request)
    }
}
