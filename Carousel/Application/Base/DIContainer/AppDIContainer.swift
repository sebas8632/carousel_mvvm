//
//  AppDIContainer.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation
import JSFSNetwork

final class AppDIContainer {

    // MARK: - NETWORK
    
    lazy var sessionProvider: URLSessionProvider = URLSessionProvider()
    
    // MARK: - Scenes DI Container
    
    func makeLoginSceneDIContainer() -> LoginSceneDIContainer {
        return LoginSceneDIContainer(sessionProvider: sessionProvider)
    }
}
