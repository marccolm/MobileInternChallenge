//
//  ProductListViewController.swift
//  Shopify
//
//  Created by Marco Lopez on 9/18/18.
//  Copyright © 2018 Marco Lopez. All rights reserved.
//

import UIKit
import SDWebImage

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var stock = Stock()
    var currentTag = String()
    var currentProducts = [Product]()
    let placeholderImage = UIImage(named: "productImagePlaceholder")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.subtitleLabel.text = "\(self.currentTag) stuff"
        self.activityIndicator.start()
        self.loadProducts()
    }
    
    /*
     * Filters the products by current tag, reloads the tableView
     * data and stops the activityIndicator animation.
     *
     */
    
    func loadProducts(){
        self.currentProducts = self.stock.filterProductsByTag(tag: currentTag)
        self.tableView.reloadData()
        self.activityIndicator.stop()
    }
    
    /*
     * Table View Delegate Methods
     *
     */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as? ProductTableViewCell{
            let currentProduct = self.currentProducts[indexPath.row]
            cell.productNameLabel.text = currentProduct.description()
            cell.vendorNameLabel.text = currentProduct.vendorName()
            cell.availableQuantityLabel.text = currentProduct.availableStock()
            if let productImageUrl = URL(string: currentProduct.imageLink){
                cell.productImageView.sd_setImage(with: productImageUrl, placeholderImage: placeholderImage)
                cell.productImageView.makeRound()
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115.0
    }
    
}
