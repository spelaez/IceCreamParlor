//
//  WelcomeViewController.swift
//  IceCreamParlor
//
//  Created by Santiago Pelaez Rua on 27/02/20.
//  Copyright © 2020 Santiago Pelaez Rua. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var reviewOrderButton: UIButton!
    var model: WelcomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = WelcomeViewModel()
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
        configureBar()
        
        model.getProducts { [weak self] _ in
            DispatchQueue.main.async {
                self?.productsCollectionView.reloadData()
            }
        }
    }
    
    func configureBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 111/255, green: 199/255, blue: 201/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? OrderViewController
        destination?.model = OrderViewModel(order: model.order)
    }
}

extension WelcomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let quantity = model.addProductToOrder(at: indexPath.item)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ProductCollectionViewCell
        
        if quantity == 0 {
            cell?.resetBorder()
        } else {
            cell?.highlightBorder(with: quantity)
        }
        
        reviewOrderButton.setTitle("ORDER \(model.order.totalItems) ITEM(S)", for: .normal)
    }
}

extension WelcomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.productCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ProductCollectionViewCell {
            model.configure(cell: cell, for: indexPath.item)
            
            return cell
        }
        
        return ProductCollectionViewCell()
    }
}
