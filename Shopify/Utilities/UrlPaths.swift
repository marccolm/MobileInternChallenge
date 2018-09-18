//
//  UrlPaths.swift
//  Shopify
//
//  Created by Marco Lopez on 9/17/18.
//  Copyright © 2018 Marco Lopez. All rights reserved.
//

import Foundation


/*
 * Static variables containing essential urls for requests
 *
 */

struct UrlPaths{
    
    static var endPointProducts: String{
        return "https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
    }
    
}

/*
 * Static variables containing essential dictionary keys for json responses
 *
 */

struct Key{
   
    static var products: String{
        return "products"
    }
    
    static var title: String{
        return "title"
    }
    
    static var id: String{
        return "id"
    }
    
    static var vendor: String{
        return "vendor"
    }
    
    static var image: String{
        return "image"
    }
    
    static var tags: String{
        return "tags"
    }
    
    static var productType: String{
        return "product_type"
    }
    
    static var variants: String{
        return "variants"
    }
    
    static var source: String{
        return "src"
    }
    
    static var inventoryQuantity: String{
        return "inventory_quantity"
    }
    
}
