//
//  CarouselViewModel.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation
import RxSwift

protocol CarouselViewModelProtocol {
    var getTokenUseCase: GetTokenUseCaseProtocol? { get set }
    var getCarouselDataUseCase: GetCarouselDataUseCaseProtocol? { get set }
    var tokenDataModel: TokenDataModel? { get set }
    
    var dataModel: PublishSubject<[CarouselDataModel]>? { get set }
    init(tokenDataModel: TokenDataModel, getTokenUseCase: GetTokenUseCaseProtocol, getCarouselDataUseCase: GetCarouselDataUseCaseProtocol)
    
    func getCarouselData()
}
class CarouselViewModel: CarouselViewModelProtocol {
    

    var getTokenUseCase: GetTokenUseCaseProtocol?
    var getCarouselDataUseCase: GetCarouselDataUseCaseProtocol?
    var tokenDataModel: TokenDataModel?
    
    var dataModel: PublishSubject<[CarouselDataModel]>?

    required init(tokenDataModel: TokenDataModel, getTokenUseCase: GetTokenUseCaseProtocol, getCarouselDataUseCase: GetCarouselDataUseCaseProtocol) {
        self.getTokenUseCase = getTokenUseCase
        self.getCarouselDataUseCase = getCarouselDataUseCase
        dataModel = PublishSubject()
    }
    
    func getCarouselData() {
        didGetCarouselData {[weak self] (result) in
            switch result {
            case .success(let dataArray):
                self?.dataModel?.onNext(dataArray)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func didGetCarouselData(completion: @escaping ((Response<[CarouselDataModel]>) -> Void))  {
        getCarouselDataUseCase?.execute(completion: completion)
        
    }
    
    //    private func validateTokenRefresh<T>(completion: @escaping ((Response<T>) -> Void)) {
    //        if storage.exist(key: storage.tokenRefreshEarmark) {
    //            let numberOfRefresh: Int? = storage.value(key: storage.tokenRefreshEarmark)
    //            if numberOfRefresh == 3 {
    //                completion(.failure(.networkError(networkError: "Has ocurred a server error")))
    //            } else {
    //                storage.write(key: storage.tokenRefreshEarmark, value: numberOfRefresh as! Int += 1 ?? 0)
    //              //  loginRepository?.getToken(completion: completion)
    //            }
    //        } else {
    //            storage.write(key: storage.tokenRefreshEarmark, value: 1)
    //        }
    //    }

}
