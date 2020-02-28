//
//  OrderViewController.swift
//  IceCreamParlor
//
//  Created by Santiago Pelaez Rua on 27/02/20.
//  Copyright © 2020 Santiago Pelaez Rua. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var orderTotalLabel: UILabel!
    @IBOutlet weak var orderDetailsTableView: UITableView!
    @IBOutlet weak var newOrderButton: UIButton!
    
    var model: OrderViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderDetailsTableView.dataSource = self
        configureViews()
    }
    
    func configureViews() {
        newOrderButton.layer.borderColor = UIColor.white.cgColor
        newOrderButton.layer.borderWidth = 3
        
        orderTotalLabel.text = "$\(model.order.total)"
    }
    
    @IBAction func newOrder(_ sender: Any) {
        model.order.newOrder()
        dismiss(animated: true, completion: nil)
    }
}

extension OrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.order.details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        model.configure(cell: cell, at: indexPath.row)
        
        return cell
    }
}
