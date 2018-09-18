//
//  ProductListViewController.swift
//  Shopify
//
//  Created by Marco Lopez on 9/18/18.
//  Copyright © 2018 Marco Lopez. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var stock = Stock()
    var currentTag = Tag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
