//
//  CarouselSceneDIContainer.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 5/08/21.
//

import Foundation
import JSFSNetwork
import UIKit

final class CarouselSceneDIContainer {

    let sessionProvider: URLSessionProvider
    
    init(sessionProvider: URLSessionProvider) {
        self.sessionProvider = sessionProvider
    }

    // MARK: - ViewModel
    
    func makeCarouselViewModel(tokenDataModel: TokenDataModel) -> CarouselViewModelProtocol {
        return CarouselViewModel(tokenDataModel: tokenDataModel, getTokenUseCase: makeGetTokenUseCase(),
                                 getCarouselDataUseCase: makeGetCarouselDataUseCase(tokenData: tokenDataModel))
    }
    
    // MARK: - Uses Cases
    func makeGetTokenUseCase() -> GetTokenUseCaseProtocol  {
        return GetTokenUseCase(loginRepository: makeLoginRepository())
    }
    
    func makeGetCarouselDataUseCase(tokenData: TokenDataModel) -> GetCarouselDataUseCaseProtocol  {
        return GetCarouselDataUseCase(carouselRepository: makeCarouselRepository(), tokenData: tokenData)
    }
    
    // MARK: - Repositories
    func makeLoginRepository() -> LoginRepositoryProtocol {
        return LoginRepository(sessionProvider: sessionProvider)
    }
    
    func makeCarouselRepository() -> CarouselRepositoryProtocol {
        return CarouselRepository(sessionProvider: sessionProvider)
    }
    
    // MARK: - Coordinator
    
    func makeLoginCoordinator(navigationController: UINavigationController) -> LoginCoordinator {
        return LoginCoordinator(navigationController: navigationController)
            
    }
    
}
