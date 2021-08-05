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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("LLEGO A LA VIEW")
        viewModel?.getCarouselData()
    }
    
    
    
    
}
