//
//  LoginCoordinator.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation
import UIKit

protocol LoginFlow: class {
    func coordinateToCarousel(token: String)
}
class LoginCoordinator: CoordinatorProtocol {
   
    private weak var navigationController: UINavigationController?
    var loginDICOntainer: LoginSceneDIContainer?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! ViewController
        viewController.viewModel = loginDICOntainer?.makeLoginViewModel()
        viewController.coordinator = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

extension LoginCoordinator: LoginFlow {
    func coordinateToCarousel(token: String) {
        // TODO
    }
    
    
}
