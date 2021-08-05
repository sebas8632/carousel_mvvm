//
//  ThumbCell.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 5/08/21.
//

import UIKit
import Kingfisher
class ThumbCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var item: CarouselItemModel? {
        didSet {
            imageTitle.text = item?.title
            imageView.setImageFrom(url: item?.imageUrl ?? "")
        }
    }
}
