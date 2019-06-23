//
//  ProductsTableViewController.swift
//  swift_01
//
//  Created by 俊祥 on 2019/6/23.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit
class ProductsTableViewController: UITableViewController {
    private var products: [Product]?
    private let identifer = "productCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        products = [
            Product(name: "1907 Wall Set", cellImageName: "image-cell1", fullScreenImageName: "phone-fullscreen1"),
            Product(name: "1921 Dial Phone", cellImageName: "image-cell2", fullScreenImageName: "phone-fullscreen2"),
            Product(name: "1937 Desk Set", cellImageName: "image-cell3", fullScreenImageName: "phone-fullscreen3"),
            Product(name: "1984 Moto Portable", cellImageName: "image-cell4", fullScreenImageName: "phone-fullscreen4")
        ]
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: identifer)
    }
    
    // MARK: - View Transfer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProduct" {
            if let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell),
            let productVC = segue.destination as? ProductViewController {
                productVC.product = products?[indexPath.row]
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ProductsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifer, for: indexPath)
        guard let products = products else { return cell}
        
        cell.textLabel?.text = products[indexPath.row].name
        if let imageName = products[indexPath.row].cellImageName {
            cell.imageView?.image = UIImage(named: imageName)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(ProductViewController(), animated: true)
    }
}


