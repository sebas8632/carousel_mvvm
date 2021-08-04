//
//  LoginRepository.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import Foundation
import JSFSNetwork
class LoginRepository: LoginRepositoryProtocol {

    var sessionProvider: URLSessionProvider?
    
    required init(sessionProvider: URLSessionProvider) {
        self.sessionProvider = sessionProvider
    }
    
    func getToken(completion: @escaping ((NetworkResponse<TokenDataModel>) -> Void)) {
        sessionProvider?.request(type: TokenDataModel.self, service: PostAuthService.pathAuth, completion: completion)
    }
    
    
}
