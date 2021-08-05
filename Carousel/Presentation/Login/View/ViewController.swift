//
//  ViewController.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import UIKit
import RxSwift
import RxCocoa
import JSFSPopUps

class ViewController: UIViewController {

    var viewModel: LoginViewModelProtocol?
    var storage: LocalStorage = LocalStorage()
    var coordinator: LoginCoordinator?
    
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        viewModel?.getToken()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupBindings() {
        
        viewModel?.token
            .subscribe(onNext: { [weak self] (token) in
                self?.storage.write(key: (self?.storage.tokenEarmark)!, value: token.token)
                self?.coordinator?.coordinateToCarousel(token: token.token)
                
            })
            .disposed(by: bag)
       
        viewModel?.error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] error in
                self?.showError(error: error)
            })
            .disposed(by: bag)
    }
    
    private func showError(error: ApplicationError) {
        switch error {
        case .networkError:
            PopUpManager.showError(error: "Has ocurred a network error", from: self)
        default:
            PopUpManager.showError(error: "Has ocurred an internal error", from: self)

        }
    }
    

}

