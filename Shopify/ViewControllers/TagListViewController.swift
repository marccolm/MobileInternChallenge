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
            else{
                // Handle error
            }
            self.activityIndicator.stop()
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
        self.performSegue(withIdentifier: "showProducts", sender: self)
    }
    
}

