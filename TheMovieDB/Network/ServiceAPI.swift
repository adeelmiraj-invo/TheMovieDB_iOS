//
//  ServiceAPI.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import Foundation

protocol ServiceAPI {
    var rawvalue: String { get }
    var baseURL: String { get }
    var endpoint: String { get }
    var headers: [String: String] { get }
}

enum BaseURL: String {
    case movieDB = "https://api.themoviedb.org/"
}

enum Services: ServiceAPI {
    case nowPlaying(page: UInt?, pageSize: UInt?)
    
    var rawvalue: String {
        switch self {
        case .nowPlaying: "nowPlaying"
        }
    }
    
    var baseURL: String {
        switch self {
        case .nowPlaying: BaseURL.movieDB.rawValue
        }
    }
    
    var endpoint: String {
        switch self {
        case .nowPlaying:
            baseURL + "3/movie/now_playing"
        }
    }
    
    var headers: [String : String] {
        ["accept": "application/json",
         "Authorization": "Bearer \(Constants.Keys.movieDBReadAccessToken)"]
    }
}
