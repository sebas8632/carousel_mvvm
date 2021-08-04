//
//  CoordinatorProtocols.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 3/08/21.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: class {
    func start()
    func coordinate(to coordinator: CoordinatorProtocol)
}

extension CoordinatorProtocol {
    func coordinate(to coordinator: CoordinatorProtocol) {
        coordinator.start()
    }
}

