//
//  CarouselTableViewCell.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 5/08/21.
//

import UIKit

class CarouselTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var type: String?
    private var items: [CarouselItemModel]?
    
    var dataModel: CarouselDataModel? {
        didSet {
            type = dataModel?.type
            items = dataModel?.items
            titleLabel.text = dataModel?.title
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CarouselTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = items?[indexPath.row]
        if type == "thumb" {
            collectionView.register(UINib(nibName: "ThumbCell", bundle: nil), forCellWithReuseIdentifier: "thumbCellRU")
           let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "thumbCellRU", for: indexPath) as! ThumbCell
            celda.imageTitleLabel.text = item?.title
            celda.imageViewThumb.setImageFrom(url: item?.imageUrl ?? "")
            return celda
        } else {
            collectionView.register(UINib(nibName: "PosterCell", bundle: nil), forCellWithReuseIdentifier: "posterCellRU")
            let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCellRU", for: indexPath) as! PosterCell
            celda.imageTitleLabel.text = item?.title
            celda.imageViewPoster.setImageFrom(url: item?.imageUrl ?? "")
            return celda
        }
        return UICollectionViewCell()
    }
}
