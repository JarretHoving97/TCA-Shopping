//
//  shoppingExampleApp.swift
//  shoppingExample
//
//  Created by Jarret Hoving on 20/06/2023.
//

import SwiftUI
import ComposableArchitecture

@main
struct shoppingExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListView(store: Store(initialState: ProductListReducer.State(), reducer: { ProductListReducer(fetchProducts: { Product.sample },sendOrder: { _ in "OK"})}))
        }
    }
}
