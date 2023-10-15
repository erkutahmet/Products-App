//
//  ViewController.swift
//  Products App
//
//  Created by Ahmet Erkut on 15.10.2023.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var productTableView: UITableView!

    var productsList = [Products]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setProducts()
        setUI()
    }
    
    private func setUI() {
        productTableView.delegate = self
        productTableView.dataSource = self
        
        productTableView.separatorStyle = .none
    }
    
    private func setProducts() {
        let p1 = Products(id: 1 , name: "Macbook Pro 14", image : "computer",price: 43000)
        let p2 = Products(id: 2 , name: "Rayban Club Master", image : "sunglasses",price: 2500)
        let p3 = Products(id: 3 , name: "Sony ZX Series", image : "headphone",price: 40000)
        let p4 = Products(id: 4 , name: "Gio Armani", image : "parfume",price: 2000)
        let p5 = Products(id: 5 , name: "Casio X Series", image : "watch",price: 8000)
        let p6 = Products(id: 6 , name: "Dyson V8", image : "mop",price: 18000)
        let p7 = Products(id: 7 , name: "IPhone 13", image : "phone",price: 32000)
        productsList.append(p1)
        productsList.append(p2)
        productsList.append(p3)
        productsList.append(p4)
        productsList.append(p5)
        productsList.append(p6)
        productsList.append(p7)
    }

}

extension HomePage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(withIdentifier: "productsCell") as! ProductsCell
        let product = productsList[indexPath.row]
        
        cell.productImageView.image = UIImage(named: product.image!)
        cell.productNameLabel.text = product.name
        cell.productPriceLabel.text = "\(product.price!) ₺"
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.cellBackground.layer.cornerRadius = 10
        
        cell.selectionStyle = .none
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let product = productsList[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            print("\(product.name!) deleted.")
        }
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { contextualAction, view, bool in
            print("\(product.name!) edited.")
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productsList[indexPath.row]
        
        performSegue(withIdentifier: "toDetail", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let product = sender as? Products {
                let toVC = segue.destination as! DetailPage
                toVC.product = product
            }
        }
    }
}

extension HomePage: CellProtocol {
    func addToBasketClicked(indexPath: IndexPath) {
        let product = productsList[indexPath.row]
        print("\(product.name!) added to basket.")
    }
}
