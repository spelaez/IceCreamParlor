//
//  WelcomeViewModel.swift
//  IceCreamParlor
//
//  Created by Santiago Pelaez Rua on 27/02/20.
//  Copyright © 2020 Santiago Pelaez Rua. All rights reserved.
//

import Foundation

class WelcomeViewModel {
    private var products: [Product] = []
    
    var productCount: Int {
        return products.count
    }
    
    private func getProducts() {
        
    }
    
    func product(at index: Int) -> Product {
        precondition(index < products.count)
        
        return products[index]
    }
}
