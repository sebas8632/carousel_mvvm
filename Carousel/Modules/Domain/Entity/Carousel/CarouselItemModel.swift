//
//  CarouselItemModel.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation

struct CarouselItemModel: Codable {
    var title: String
    var imageUrl: String
    var videoUrl: String?
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageUrl
        case videoUrl
        case description
    }
}
