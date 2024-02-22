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
         "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYTE5MjY1ZjI1ZWFlZTRmNWQ0MDYzMGYwZjU2OGNmNiIsInN1YiI6IjY1ZDU3Zjg2NjA5NzUwMDE4NTIzMTcxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1l76sXf4MxzZWJtU_xW4-wDCN2wrjADsUtuz5_tT7r4"]
    }
}
