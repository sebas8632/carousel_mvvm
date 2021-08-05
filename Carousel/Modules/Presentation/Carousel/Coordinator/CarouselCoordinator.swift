//
//  CarouselCoordinator.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation
import UIKit

class CarouselCoordinator: CoordinatorProtocol {
   
    private weak var navigationController: UINavigationController?
    var carouselDIContainer: CarouselSceneDIContainer?
    var tokenData: TokenDataModel?
    
    init(navigationController: UINavigationController, carouselDIContainer: CarouselSceneDIContainer, tokenDataModel: TokenDataModel) {
        self.navigationController = navigationController
        self.carouselDIContainer = carouselDIContainer
        self.tokenData = tokenDataModel
    }
    
    func start() {
        guard let tokenDataStrong = self.tokenData else { return }
        let storyBoard: UIStoryboard = UIStoryboard(name: "Carousel", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CarouselVC") as! CarouselViewController
        viewController.viewModel = carouselDIContainer?.makeCarouselViewModel(tokenDataModel: tokenDataStrong)
     
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}
