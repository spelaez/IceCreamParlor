//
//  Services.swift
//  IceCreamParlor
//
//  Created by Santiago Pelaez Rua on 27/02/20.
//  Copyright © 2020 Santiago Pelaez Rua. All rights reserved.
//

import Foundation

typealias ProductCompletion = ([Product]) -> ()

class Services {
    private let endpoint = "https://gl-endpoint.herokuapp.com/products"
    static let shared = Services()
    
    private init() {}
    
    func getProducts(completionHandler: @escaping ProductCompletion) {
        guard let url = URL(string: endpoint) else {
            completionHandler([])
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                print(error!.localizedDescription)
                completionHandler([])
            } else {
                guard let data = data else {
                    print("could not get data")
                    completionHandler([])
                    return
                }
                
                do {
                    let products = try JSONDecoder().decode([Product].self, from: data)
                    completionHandler(products)
                } catch {
                    print(error.localizedDescription)
                    completionHandler([])
                }
            }
        }
        
        dataTask.resume()
    }
}
