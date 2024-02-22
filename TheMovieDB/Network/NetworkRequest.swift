//
//  NetworkRequest.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import Foundation
import Alamofire

typealias RequestMethod = Alamofire.HTTPMethod

struct NetworkRequest {
    let service: ServiceAPI
    let method: RequestMethod
    let decoder: JSONDecoder
    let headers: [String: String]?
    let parameters: [String: Any]?
    let encoding: ParameterEncoding
    
    init(service: ServiceAPI,
         method: RequestMethod,
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
