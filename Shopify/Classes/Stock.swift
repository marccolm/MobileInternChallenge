//
//  Stock.swift
//  Shopify
//
//  Created by Marco Lopez on 9/17/18.
//  Copyright © 2018 Marco Lopez. All rights reserved.
//

import Foundation

/*
 * Represents the store stock, it stores the products and tags of the store
 *
 */

class Stock{
    var products = [Product]()
    var tags = Set<String>()
    
    /*
     * Filter the products of the store by tag
     *
     * - Paramters:
     *    - tag: The specific tag by which products
     *           will be filtered in a string.
     *
     * - Returns: An array with only the products
     *            belonging to that tag.
     *
     */
    
    func filterProductsByTag(tag: String) -> [Product]{
        return products.filter({ product in
            return product.tags.contains(tag)
        })
    }
    
}
