//
//  UseCaseProtocol.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import Foundation

typealias Response<T> = Result<T,ApplicationError>
protocol UseCaseProtocol {
    func execute<T>(completion: @escaping ((Response<T>) -> Void))
}

