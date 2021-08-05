//
//  CarouselDataModel.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation

struct CarouselDataModel: Codable {
    
    var title: String
    var type: String
    var items: [CarouselItemModel]
    
    enum CodingKeys: String, CodingKey {
        case title
        case type
        case items
    }
    
}
