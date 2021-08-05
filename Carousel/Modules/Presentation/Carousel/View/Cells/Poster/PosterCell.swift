//
//  PosterCell.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 5/08/21.
//

import UIKit
import  Kingfisher
class PosterCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var imageTitleLabel: UILabel!

    var item: CarouselItemModel? {
        didSet {
            imageTitleLabel.text = item?.title
            imageViewPoster.setImageFrom(url: item?.imageUrl ?? "")
        }
    }
}
