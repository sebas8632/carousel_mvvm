//
//  TokenDataModel.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import Foundation

struct TokenDataModel: Codable {
    var token: String
    var type: String

    enum CodingKeys: String, CodingKey {
        case token = "token"
        case type = "type"
    }
}
