//
//  LoginService.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import Foundation
import JSFSNetwork

enum PostAuthService: ServiceProtocol {
    case pathAuth
    
    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    var path: String {
        return "/v1/mobile/auth"
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var task: Task {
        let parameters = ["sub": NetworkConstants.subValue]
        return .requestParameters(parameters)
    }
    
    var headers: Headers {
        return [:]
    }
    
    var parametersEncoding: ParametersEncoding {
        return .json
    }
    
}
