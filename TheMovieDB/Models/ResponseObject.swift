//
//  ResponseObject.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import Foundation

// MARK: - ResponseObject
struct ResponseObject<T: Codable>: Codable {
    let page: Int
    let results: T
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
