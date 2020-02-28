//
//  OrderViewModel.swift
//  IceCreamParlor
//
//  Created by Santiago Pelaez Rua on 27/02/20.
//  Copyright © 2020 Santiago Pelaez Rua. All rights reserved.
//

import Foundation
import UIKit

class OrderViewModel {
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    func configure(cell: UITableViewCell, at index: Int) {
        let detail = order.details[index]
        
        let productName = detail.product.name + (detail.quantity == 2 ? " (2)" : "")
        
        cell.textLabel?.text = productName
        cell.detailTextLabel?.text = detail.product.price
    }
}
