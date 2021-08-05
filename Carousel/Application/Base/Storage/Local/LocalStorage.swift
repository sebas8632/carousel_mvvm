//
//  LocalStorage.swift
//  Carousel
//
//  Created by Juan Sebastian Florez Saavedra on 4/08/21.
//

import Foundation

protocol LocalStorageProtocol {
    func value<T>(key: String) -> T?
    func write<T>(key: String, value: T?)
    func remove(key: String)
    func exist(key: String) -> Bool
}

class LocalStorage: LocalStorageProtocol {
    fileprivate let userDefaults: UserDefaults = UserDefaults.standard
    
    let tokenEarmark: String = "tokenEarmark"
    
    func value<T>(key: String) -> T? {
        return self.userDefaults.object(forKey: key) as? T
    }
    
    func write<T>(key: String, value: T?) {
        self.userDefaults.set(value, forKey: key)
    }
    
    func remove(key: String) {
        self.userDefaults.set(nil, forKey: key)
    }
    
    func exist(key: String) -> Bool {
        let value = userDefaults.object(forKey: key)
        return value != nil
    }
}
