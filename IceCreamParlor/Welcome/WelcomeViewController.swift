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
        productsCollectionView.delegate = model
        productsCollectionView.dataSource = self
        
        
        model.getProducts { [weak self] _ in
            DispatchQueue.main.async {
                self?.productsCollectionView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? OrderViewController
        destination?.order = model.order
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
