//
//  Product.swift
//  Shopify
//
//  Created by Marco Lopez on 9/17/18.
//  Copyright © 2018 Marco Lopez. All rights reserved.
//

import Foundation


class Product{
    var name = String()
    var imageLink = String()
    var vendor = String()
    var productType = String()
    var tags = Set<String>()
    var id = Int()
    
    init?(json: [String: Any]) {
        guard let name = json["title"] as? String,
            let id = json["id"] as? Int,
            let vendor = json["vendor"] as? String,
            let image = json["image"] as? [String: Any],
            let tags = json["tags"] as? String,
            let productType = json["product_type"] as? String
            else {
                return nil
            }
        self.name = name
        self.id = id
        self.tags = Set(tags.components(separatedBy: ", "))
        self.vendor = vendor
        self.productType = productType
        if let imageLink = image["src"] as? String{
            self.imageLink = imageLink
        }
    }
    
    func description() -> String{
        var description = String()
        description = "\(name) - \(productType)"
        return description
    }
    
}
