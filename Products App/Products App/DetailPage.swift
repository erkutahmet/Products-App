//
//  DetailPage.swift
//  Products App
//
//  Created by Ahmet Erkut on 15.10.2023.
//

import UIKit

class DetailPage: UIViewController {

    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!

    var product: Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let p = product {
            self.navigationItem.title = p.name
            productImageView.image = UIImage(named: p.image!)
            productPriceLabel.text = "\(p.price!) ₺"
        }
    }

    @IBAction func addToBasketButton(_ sender: Any) {
        if let p = product {
            print("Detail Page: \(p.name!) added to basket.")
        }
    }
}
