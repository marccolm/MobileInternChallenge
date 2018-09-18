//
//  Product.swift
//  Shopify
//
//  Created by Marco Lopez on 9/17/18.
//  Copyright © 2018 Marco Lopez. All rights reserved.
//

import Foundation

/*
 * Store product, it stores essential information about the products found in the store
 *
 */

class Product{
    var name = String()
    var imageLink = String()
    var vendor = String()
    var productType = String()
    var tags = Set<String>()
    var id = Int()
    var available = Int()
    
    /*
     * Initializes a new product with the provided information.
     *
     * - Paramters:
     *    - json: Dictionary decoded from json response from the server,
     *            it contains title, vendor, tags and product_type as
     *            strings, id as an integer, image as a dictionary, an variants
     *            as an array of dictionaries.
     *
     * - Returns: A custom product product.
     *
     */
    
    init?(json: [String: Any]) {
        guard let name = json[Key.title] as? String,
            let id = json[Key.id] as? Int,
            let vendor = json[Key.vendor] as? String,
            let image = json[Key.image] as? [String: Any],
            let tags = json[Key.tags] as? String,
            let productType = json[Key.productType] as? String,
            let variants = json[Key.variants] as? [[String: Any]]
            else {
                return nil
            }
        self.name = name
        self.id = id
        self.tags = Set(tags.components(separatedBy: ", "))
        self.vendor = vendor
        self.productType = productType
        if let imageLink = image[Key.source] as? String{
            self.imageLink = imageLink
        }
        for variant in variants{
            if let inventoryQuantity = variant[Key.inventoryQuantity] as? Int{
                self.available += inventoryQuantity
            }
        }
    }
    
    /*
     * Get a string with the product's description.
     *
     * This method returns an initialized string containing
     * essential information about the product.
     *
     */
    
    func description() -> String{
        var description = String()
        description = "\(self.name)"
        return description
    }
    
    /*
     * Get a string with the product's vendor.
     *
     * This method returns an initialized string containing
     * the product's vendor.
     *
     */
    
    func vendorName() -> String{
        var vendor = String()
        vendor = "\(self.vendor)"
        return vendor
    }
    
    /*
     * Get a string with the available quantity of the product.
     *
     * This method returns an initialized string containing
     * this product's available quantity across all variants.
     *
     */
    
    func availableStock() -> String{
        var available = String()
        available = "\(self.available) available"
        return available
    }
    
}
