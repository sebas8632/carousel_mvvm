//
//  CarouselViewController.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 5/08/21.
//

import UIKit
import RxSwift

class CarouselViewController: UIViewController {
    @IBOutlet weak var carouselTableView: UITableView!
    
    var viewModel: CarouselViewModelProtocol?
    var tokenDataModel: TokenDataModel?
    
    var dataModel: [CarouselDataModel]?
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carouselTableView.dataSource = self
        carouselTableView.delegate = self
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
        viewModel?.dataModel?
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] data in
                self?.dataModel = data
                self?.carouselTableView.reloadData()
            })
            .disposed(by: bag)
    }
    
    private func setupUI() {
        carouselTableView.register(UINib(nibName: "CarouselTableViewCell", bundle: nil), forCellReuseIdentifier: "carouselTVCell")
    }
    
}

extension CarouselViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carouselTVCell") as! CarouselTableViewCell
        cell.dataModel = dataModel?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

