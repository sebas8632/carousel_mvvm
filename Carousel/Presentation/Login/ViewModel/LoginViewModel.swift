//
//  LoginViewModel.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation
import JSFSNetwork
import RxCocoa
import RxSwift

protocol LoginViewModelProtocol {
    var getTokenUseCase: GetTokenUseCaseProtocol? { get set }
    var token: PublishSubject<TokenDataModel> { get set }
    var loading: PublishSubject<Bool> { get set }
    var error: PublishSubject<ApplicationError> { get set }
    
    init(getTokenUseCase: GetTokenUseCaseProtocol)
    
    func getToken()
}


class LoginViewModel: LoginViewModelProtocol {

    var getTokenUseCase: GetTokenUseCaseProtocol?
    
    public var token: PublishSubject<TokenDataModel> = PublishSubject()
    public var loading: PublishSubject<Bool> = PublishSubject()
    public var error: PublishSubject<ApplicationError> = PublishSubject()
    
    required init(getTokenUseCase: GetTokenUseCaseProtocol) {
        self.getTokenUseCase = getTokenUseCase
    }
    
    func getToken() {
        self.loading.onNext(true)
        didGetToken {[weak self] (result) in
            self?.loading.onNext(false)
            switch result {
            case .success(let token):
                self?.token.onNext(token)
            case .failure(let error):
                self?.error.onNext(error)
            }
        }
    }
    
    private func didGetToken(completion: @escaping ((Response<TokenDataModel>) -> Void))  {
        getTokenUseCase?.execute(completion: completion)
        
    }
}
