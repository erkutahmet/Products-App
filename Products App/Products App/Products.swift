//
//  Products.swift
//  Products App
//
//  Created by Ahmet Erkut on 15.10.2023.
//

import Foundation

class Products {
    var id: Int?
    var name: String?
    var image: String?
    var price: Int?
    
    init(id: Int, name: String, image: String, price: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
    }
}
