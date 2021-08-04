//
//  LoginRepositoryProtocol.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import Foundation
import JSFSNetwork
protocol LoginRepositoryProtocol {
    var sessionProvider: URLSessionProvider? { get set }
    
    init(sessionProvider: URLSessionProvider)

    func getToken(completion: @escaping ((NetworkResponse<TokenDataModel>) -> Void))
}
