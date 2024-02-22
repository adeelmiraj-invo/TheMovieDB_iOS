//
//  CommonError.swift
//  TheMovieDB
//
//  Created by Admin on 22/02/2024.
//

import Foundation

enum CommonError: LocalizedError {
    case initFailure(identifier: String)
    case invalidURL(url: String)
    case custom(text: String)
    
    var localizedDescription: String {
        switch self {
        case .initFailure(let identifier): return "Unable to init resource with identifier \(identifier)"
        case .invalidURL(let url): return "Invalid URL: \(url)"
        case .custom(let text): return text
        }
    }
    
    var errorDescription: String? { localizedDescription }
    
    init(error: Error) {
        self = .custom(text: error.localizedDescription)
    }
    
    init(error: Error?, placeHolder: String) {
        if let error = error {
            self = .init(error: error)
        } else {
            self = .custom(text: placeHolder)
        }
    }
    
    static func toCommonError(_ error: Error) -> CommonError { .init(error: error) }
}
