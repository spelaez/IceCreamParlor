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
    
    func getProducts(completionHandler: @escaping (Bool) -> Void) {
        Services.shared.getProducts { [weak self] products in
            self?.products = products
            completionHandler(true)
        }
    }
    
    func configure(cell: ProductCollectionViewCell, for index: Int) {
        precondition(index < products.count)
        
        let product = products[index]
        
        cell.nameLabel.text = product.name
        cell.productImageView.image = UIImage(named: product.type)
        cell.priceLabel.text = product.price
        cell.imageBackgroundView.backgroundColor = UIColor.systemBlue
    }
}
