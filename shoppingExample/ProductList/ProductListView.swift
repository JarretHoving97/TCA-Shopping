//
//  ProductListView.swift
//  shoppingExample
//
//  Created by Jarret Hoving on 20/06/2023.
//

import SwiftUI
import ComposableArchitecture

struct ProductListView: View {
    
    let store: StoreOf<ProductListReducer>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            ScrollView {
                VStack {
                    ForEachStore(
                        self.store.scope(
                            state: \.productList,
                            action: ProductListReducer.Action
                                .product(id: action:)
                        )
                    ) {
                        ProductCell(store: $0)
                    }
                }
                .task {
                    viewStore.send(.fetchProducts)
            }
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(
            store: Store(
                initialState: ProductListReducer.State(),
                reducer: {
                    ProductListReducer(
                        fetchProducts: { Product.sample },
                        sendOrder: { _ in "OK"})
                    
                }
            )
        )
    }
}
