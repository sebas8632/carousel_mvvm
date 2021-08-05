//
//  GetTokenUseCase.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import Foundation
import JSFSNetwork

protocol GetTokenUseCaseProtocol: UseCaseProtocol {
    var loginRepository: LoginRepositoryProtocol? { get set }
    init(loginRepository:LoginRepositoryProtocol)
}

class GetTokenUseCase: GetTokenUseCaseProtocol {
    
    var loginRepository: LoginRepositoryProtocol?

    required init(loginRepository: LoginRepositoryProtocol) {
        self.loginRepository = loginRepository
    }
    
    func execute<T>(completion: @escaping ((Response<T>) -> Void)) {
        getToken(completion: completion)
    }
    
    private func getToken<T>(completion: @escaping ((Response<T>) -> Void)) {
        loginRepository?.getToken(completion: {[weak self] (result) in
            switch result {
            case .success(let token):
                completion(.success(token as! T))
            case .failure(let error):
                switch error {
                case .internalError:
                    self?.getToken(completion: completion)
                default:
                    completion(.failure(ApplicationError.appError))
                }
            }
        })
    }
}
