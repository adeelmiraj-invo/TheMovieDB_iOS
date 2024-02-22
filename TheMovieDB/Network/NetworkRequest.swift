//
//  NetworkRequest.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import Foundation
import Alamofire

typealias RequesMethod = Alamofire.HTTPMethod

protocol ServiceAPI {
    var rawvalue: String { get }
    var baseURL: String { get }
    var endpoint: String { get }
    var headers: [String: String] { get }
}

struct NetworkRequest {
    let service: ServiceAPI
    let method: RequesMethod
    let decoder: JSONDecoder
    let headers: [String: String]?
    let parameters: [String: Any]?
    let encoding: ParameterEncoding
    
    init(service: ServiceAPI,
         method: RequesMethod,
         decoder: JSONDecoder? = nil,
         headers: [String : String]? = nil,
         parameters: [String : Any]? = nil) {
        self.service = service
        self.method = method
        self.decoder = decoder ?? JSONDecoder()
        self.headers = headers
        self.parameters = parameters
        self.encoding = method == .post ? JSONEncoding.default : URLEncoding.default
    }
}
