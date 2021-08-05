//
//  GetCarouselDataService.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation
import JSFSNetwork

enum GetCarouselDataService: ServiceProtocol {
    
    case data(type: String, token: String)
    
    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    var path: String {
        return "/v1/mobile/data"
    }
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: Headers {
        switch self {
        case .data(let type, let token):
            let headers: [String: String] = ["authorization": "\(type) \(token)"]
        return headers
        }
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
    
}
