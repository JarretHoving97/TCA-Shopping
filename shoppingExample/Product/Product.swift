//
//  Product.swift
//  shoppingExample
//
//  Created by Jarret Hoving on 20/06/2023.
//

import Foundation

struct Product: Equatable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let imageString: String
}

extension Product {
    static var sample: [Product] =
    [
        Product(id: 0,
                title: "Dikke Sokken",
                price: 22.3,
                description: "Introducing our exquisite collection of socks, where comfort meets style! Step up your fashion game and treat your feet to a shopping experience like no other. Whether you're looking for athletic performance socks, cozy winter essentials, or trendy fashion statements, we have got you covered.",
                imageString: "soks_image"),
        
        Product(id: 1,
                title: "T-Shirt",
                price: 29.99,
                description: "Zieke tshirt",
                imageString: "tshirt_image"),
    ]
}

