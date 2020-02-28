//
//  ProductCollectionViewCell.swift
//  IceCreamParlor
//
//  Created by Santiago Pelaez Rua on 27/02/20.
//  Copyright © 2020 Santiago Pelaez Rua. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        imageBackgroundView.layer.cornerRadius = imageBackgroundView.frame.height / 2
        resetBorder()
    }
    
    func highlightBorder(with quantity: Int) {
        containerView.layer.borderColor = UIColor.cyan.cgColor
        containerView.layer.borderWidth = 3.0
    }
    
    func resetBorder(){
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1.0
        self.layoutIfNeeded()
        self.layoutSubviews()
    }
    
}
