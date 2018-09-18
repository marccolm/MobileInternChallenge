//
//  Stock.swift
//  Shopify
//
//  Created by Marco Lopez on 9/17/18.
//  Copyright © 2018 Marco Lopez. All rights reserved.
//

import Foundation

class Stock{
    var products = [Product]()
    var tags = Set<String>()
    
    func filterProductsByTag(tag: String) -> [Product]{
        return products.filter({ product in
            return product.tags.contains(tag)
        })
    }
}
