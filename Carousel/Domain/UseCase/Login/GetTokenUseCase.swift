//
//  GetTokenUseCase.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import Foundation

protocol GetTokenUseCaseProtocol {
    var loginRepository: LoginRepositoryProtocol? { get set }
    init(loginRepository:LoginRepositoryProtocol)
}

class GetTokenUseCase: UseCaseProtocol, GetTokenUseCaseProtocol {
    required init(loginRepository: LoginRepositoryProtocol) {
        self.loginRepository = loginRepository
    }
    
    var loginRepository: LoginRepositoryProtocol?
    
//    init(loginRepository: LoginRepositoryProtocol) {
//        self.loginRepository = loginRepository
//    }

    func execute<T>(completion: @escaping ((Response<T>) -> Void)) {
        
    }
    
    
}
