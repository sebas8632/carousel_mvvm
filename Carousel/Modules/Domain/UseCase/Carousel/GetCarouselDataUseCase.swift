//
//  GetCarouselDataUseCase.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation

protocol GetCarouselDataUseCaseProtocol: UseCaseProtocol {
    var carouselRepository: CarouselRepositoryProtocol? { get set }
    var tokenData: TokenDataModel { get set }
    
    init(carouselRepository: CarouselRepositoryProtocol, tokenData: TokenDataModel)
}

class GetCarouselDataUseCase: GetCarouselDataUseCaseProtocol {
    
    var carouselRepository: CarouselRepositoryProtocol?
    var tokenData: TokenDataModel
    
    let storage: LocalStorage = LocalStorage()
    
    required init(carouselRepository: CarouselRepositoryProtocol, tokenData: TokenDataModel) {
        self.carouselRepository = carouselRepository
        self.tokenData = tokenData
    }
    
    func execute<T>(completion: @escaping ((Response<T>) -> Void)) {
        getData(type: tokenData.type, token: tokenData.token, completion: completion)
    }
    
    private func getData<T>(type: String, token: String, completion: @escaping ((Response<T>) -> Void)) {
        carouselRepository?.getCarouselData(type: type, token: token, completion: { (result) in
            switch result {
            case .success(let carouselDataArray):
                completion(.success(carouselDataArray as! T))
            case .failure(let error):
                completion(.failure(ApplicationError.networkError(networkError: error.rawValue)))
            }
        })
    }
}
