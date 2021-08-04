//
//  ApplicationError.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import Foundation
enum ApplicationError: Error {
    case networkError(networkError: String)
    case appError
    case infraestructureError(descriptionError: String)
    case domainError(description: String)
    
    var localizedDescription: String {
        switch self {
        case .appError:
            return "Has occurred an expected error, please try again!"
        case let .networkError(networkError):
            return networkError
        case let .infraestructureError(descriptionError):
            return descriptionError
        case .domainError(description: let description):
            return description
        }
    }
}
