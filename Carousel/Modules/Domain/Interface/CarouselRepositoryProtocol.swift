//
//  CarouselRepositoryProtocol.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation
import JSFSNetwork

protocol CarouselRepositoryProtocol {
    var sessionProvider: URLSessionProvider? { get set }
    
    init(sessionProvider: URLSessionProvider)

    func getCarouselData(type: String, token: String, completion: @escaping ((NetworkResponse<[CarouselDataModel]>) -> Void))

}
