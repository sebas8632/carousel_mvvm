//
//  AppCoordinator.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import Foundation
import UIKit

class AppCoordinator: CoordinatorProtocol {
    
    let window: UIWindow
    private let appDIContainer: AppDIContainer
    let storage: LocalStorage = LocalStorage()
    
    init(window: UIWindow, appDIContainer: AppDIContainer) {
        self.window = window
        self.appDIContainer = appDIContainer
    }

    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        if storage.exist(key: storage.tokenEarmark) {
            // TODO: Continue carousel
        } else {
            let loginSceneDIContainer = appDIContainer.makeLoginSceneDIContainer()
            let loginCoordinator = loginSceneDIContainer.makeLoginCoordinator(navigationController: navigationController)
            loginCoordinator.loginDICOntainer = loginSceneDIContainer
            coordinate(to: loginCoordinator)
        }
        

    }
    
}
