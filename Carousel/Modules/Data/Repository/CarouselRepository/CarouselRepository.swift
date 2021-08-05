//
//  CarouselRepository.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation
import JSFSNetwork
class CarouselRepository: CarouselRepositoryProtocol {
    var sessionProvider: URLSessionProvider?
    
    required init(sessionProvider: URLSessionProvider) {
        self.sessionProvider = sessionProvider
    }
    
    func getCarouselData(type: String, token: String, completion: @escaping ((NetworkResponse<[CarouselDataModel]>) -> Void)) {
        sessionProvider?.request(type: [CarouselDataModel].self, service: GetCarouselDataService.data(type: type, token: token), completion: completion)
    }
    
    
}
