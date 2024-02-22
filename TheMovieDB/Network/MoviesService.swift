//
//  MoviesService.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import Foundation
import Combine

class MoviesService {
    static func fetchNowPlaying(pageNumber: Int, pageSize: Int) -> AnyPublisher<ResponseObject<[Media]>, CommonError> {
        let service = Services.nowPlaying(page: UInt(pageNumber), pageSize: UInt(pageSize))
        let request = NetworkRequest(service: service, method: .get, headers: service.headers, parameters: ["language": "en-US", "page": 1])
        return APIClient.executeRequest(request: request)
    }
}
