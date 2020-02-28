//
//  WelcomeViewModel.swift
//  IceCreamParlor
//
//  Created by Santiago Pelaez Rua on 27/02/20.
//  Copyright © 2020 Santiago Pelaez Rua. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewModel: NSObject {
    private var products: [Product] = []
    private(set) var order = Order(details: [])
    
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

extension WelcomeViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.item]
        
        order.add(product: product)
    }
}
