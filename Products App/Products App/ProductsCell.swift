//
//  ProductsCell.swift
//  Products App
//
//  Created by Ahmet Erkut on 15.10.2023.
//

import UIKit

protocol CellProtocol {
    func addToBasketClicked(indexPath: IndexPath)
}

class ProductsCell: UITableViewCell {

    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var cellProtocol: CellProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func addToBasketButton(_ sender: Any) {
        cellProtocol?.addToBasketClicked(indexPath: indexPath!)
    }
}
