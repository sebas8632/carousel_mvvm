//
//  LoginSceneDIContainer.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation
import JSFSNetwork
import UIKit

final class LoginSceneDIContainer {

    let sessionProvider: URLSessionProvider
    
    init(sessionProvider: URLSessionProvider) {
        self.sessionProvider = sessionProvider
    }

    // MARK: - ViewModel
    
    func makeLoginViewModel() -> LoginViewModelProtocol {
        return LoginViewModel(getTokenUseCase: makeGetTokenUseCase())
    }
    
    // MARK: - Uses Cases
    func makeGetTokenUseCase() -> GetTokenUseCaseProtocol  {
        return GetTokenUseCase(loginRepository: makeLoginRepository())
    }
    
    // MARK: - Repositories
    func makeLoginRepository() -> LoginRepositoryProtocol {
        return LoginRepository(sessionProvider: sessionProvider)
    }
    
    // MARK: - Coordinator
    
    func makeLoginCoordinator(navigationController: UINavigationController) -> LoginCoordinator {
        return LoginCoordinator(navigationController: navigationController)
            
    }
    
}
