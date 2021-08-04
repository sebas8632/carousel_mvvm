//
//  LoginViewModel.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation
protocol LoginViewModelProtocol {
    var getTokenUseCase: GetTokenUseCaseProtocol? { get set }
    
    init(getTokenUseCase: GetTokenUseCaseProtocol)
}

class LoginViewModel: LoginViewModelProtocol {
    var getTokenUseCase: GetTokenUseCaseProtocol?
    
    required init(getTokenUseCase: GetTokenUseCaseProtocol) {
        self.getTokenUseCase = getTokenUseCase
        print("VIEW MODEL")
        }
}
