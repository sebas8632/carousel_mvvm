//
//  CarouselViewController.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 5/08/21.
//

import UIKit
import RxSwift
import RxCocoa

class CarouselViewController: UIViewController {
    @IBOutlet weak var postersTitle: UILabel!
    @IBOutlet weak var thumbsTitle: UILabel!
    @IBOutlet weak var postersCollectionView: UICollectionView!
    @IBOutlet weak var thumbsCollectionView: UICollectionView!
    
    var viewModel: CarouselViewModelProtocol?
    var tokenDataModel: TokenDataModel?
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel?.getCarouselData()
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
        
        // MARK: Posters Section
        viewModel?.posters?
            .map({$0.first?.title})
            .bind(to: postersTitle.rx.text)
            .disposed(by: bag)
        
        viewModel?.posters?
            .asObservable()
            .map{ $0.first!.items}
            .bind(to: postersCollectionView.rx
                    .items(cellIdentifier: "posterCellRU", cellType: PosterCell.self)) { (row, poster, cell) in
                cell.item = poster
            }.disposed(by: bag)
        
        // MARK: - Thumbs Section
        
        viewModel?.thumbs?
            .map({$0.first?.title})
            .bind(to: thumbsTitle.rx.text)
            .disposed(by: bag)
        
        viewModel?.thumbs?
            .asObservable()
            .map{ $0.first!.items}
            .bind(to: thumbsCollectionView.rx
                    .items(cellIdentifier: "thumbCellRU", cellType: ThumbCell.self)) { (row, thumb, cell) in
                cell.item = thumb
            }.disposed(by: bag)
    }
    
    private func setupUI() {
        thumbsCollectionView.register(UINib(nibName: "ThumbCell", bundle: nil), forCellWithReuseIdentifier: "thumbCellRU")
        postersCollectionView.register(UINib(nibName: "PosterCell", bundle: nil), forCellWithReuseIdentifier: "posterCellRU")
    }
    
    
}
