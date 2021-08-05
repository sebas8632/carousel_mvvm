//
//  ThumbCell.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 5/08/21.
//

import UIKit
import Kingfisher
class ThumbCell: UICollectionViewCell {

    @IBOutlet weak var imageViewThumb: UIImageView!
    @IBOutlet weak var imageTitleLabel: UILabel!

    var item: CarouselItemModel? {
        didSet {
            imageTitleLabel.text = item?.title
            imageViewThumb.setImageFrom(url: item?.imageUrl ?? "")
        }
    }
}
