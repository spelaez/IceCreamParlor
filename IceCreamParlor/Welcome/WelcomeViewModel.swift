//
//  WelcomeViewModel.swift
//  IceCreamParlor
//
//  Created by Santiago Pelaez Rua on 27/02/20.
//  Copyright © 2020 Santiago Pelaez Rua. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewModel {
    private var products: [Product] = []
    
    var productCount: Int {
        return products.count
    }
    
    init() {
        getProducts()
    }
    
    private func getProducts() {
        Services.shared.getProducts { [weak self] products in
            self?.products = products
        }
    }
    
    func configure(cell: UICollectionViewCell, for index: Int) {
        precondition(index < products.count)
        
        //Configure cell data
    }
}
