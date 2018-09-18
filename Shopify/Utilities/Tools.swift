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
    
    /*
     * Animates the activityIndicatorView with classic spinning
     * animation with a fade in animation.
     *
     */
    
    func start(){
        UIView.animate(withDuration: 0.4, animations: {
            self.alpha = 1.0
        })
        self.startAnimating()
    }
    
    /*
     * Stops the activityIndicatorView animation with
     * a fade out animation.
     *
     */
    
    func stop(){
        UIView.animate(withDuration: 0.4, animations: {
            self.alpha = 0.0
        }) { (finished) in
            self.stopAnimating()
        }
    }
    
}

extension UIImageView{
    
    /*
     * Makes a squared UIImageView, completely round.
     *
     */
    
    func makeRound(){
        let radius = self.frame.size.height / 2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
}
