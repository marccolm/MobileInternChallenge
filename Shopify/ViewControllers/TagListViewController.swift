//
//  TagListViewController.swift
//  Shopify
//
//  Created by Marco Lopez on 9/17/18.
//  Copyright © 2018 Marco Lopez. All rights reserved.
//

import UIKit
import Alamofire

class TagListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var stock = Stock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.start()
        self.loadProducts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
     * Loads the products from a json response received from the API
     * and initializes the corresponding products, adding them to the stock
     * as well as adds the products' tags to the stock tag set to keep the
     * tags unique, and reloads the tableView data so that it becomes visible.
     *
     */

    func loadProducts(){
        Alamofire.request(UrlPaths.endPointProducts, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            if response.result.isSuccess{
                if let response = response.result.value as? [String: Any]{
                    if let productList = response[Key.products] as? [[String: Any]]{
                        for (index, productDict) in productList.enumerated(){
                            if let product = Product(json: productDict){
                                self.stock.products.insert(product, at: index)
                                for tag in product.tags{
                                    self.stock.tags.insert(tag)
                                }
                            }
                        }
                        self.tableView.reloadData()
                    }
                }
            }
            self.activityIndicator.stop()
        }
    }
    
    /*
     * Sets the selected tag and stock to the productListViewController
     * before performing the segue.
     *
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProducts"{
            if let productViewController = segue.destination as? ProductListViewController{
                if let selectedTag = sender as? String{
                    productViewController.stock = self.stock
                    productViewController.currentTag = selectedTag
                }
            }
        }
    }
    
    /*
     * Table View Delegate Methods
     *
     */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stock.tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tagCell") as? TagTableViewCell{
            cell.tagNameLabel.text = self.stock.tags[self.stock.tags.index(self.stock.tags.startIndex, offsetBy: indexPath.row)]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTag = self.stock.tags[self.stock.tags.index(self.stock.tags.startIndex, offsetBy: indexPath.row)]
        self.performSegue(withIdentifier: "showProducts", sender: selectedTag)
    }
    
}

