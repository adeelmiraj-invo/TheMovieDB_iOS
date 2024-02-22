//
//  APIClient.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import Alamofire
import Combine
import Foundation

struct AlamofireManager {
    static let shared: Session = {
        let configuration: URLSessionConfiguration = .default
        configuration.timeoutIntervalForRequest    = 20
        configuration.timeoutIntervalForResource   = 20
        return Session(configuration: configuration)
    }()
}

class APIClient {
    func executeRequest<T: Decodable>(request: NetworkRequest) -> AnyPublisher<T, CommonError> {
        let service = request.service
        return AlamofireManager.shared
            .request(service.endpoint, method: request.method, parameters: request.parameters, encoding: request.encoding, headers: HTTPHeaders(request.headers ?? [:]))
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .mapError(CommonError.toCommonError)
            .eraseToAnyPublisher()
    }
}
