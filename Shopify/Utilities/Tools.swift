//
//  Tools.swift
//  Shopify
//
//  Created by Marco Lopez on 9/17/18.
//  Copyright © 2018 Marco Lopez. All rights reserved.
//

import Foundation
import UIKit

extension UIActivityIndicatorView{
    
    func start(){
        UIView.animate(withDuration: 0.4, animations: {
            self.alpha = 1.0
        })
        self.startAnimating()
    }
    
    func stop(){
        UIView.animate(withDuration: 0.4, animations: {
            self.alpha = 0.0
        }) { (finished) in
            self.stopAnimating()
        }
    }
    
}
