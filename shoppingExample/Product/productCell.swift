//
//  ProductView.swift
//  shoppingExample
//
//  Created by Jarret Hoving on 20/06/2023.
//

import SwiftUI
import ComposableArchitecture

struct ProductCell: View {
    
    let store: StoreOf<ProductReducer>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Image(viewStore.product.imageString)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                
                VStack(alignment: .leading) {
                    Text(viewStore.product.title)
                    HStack {
                        Text("$\(viewStore.product.price.description)")
                            .font(.custom("AmericanTypewriter", size: 25))
                            .fontWeight(.bold)
                        Spacer()
                        AddToCartButton(
                            store: self.store.scope(
                                state: \.addToCartState,
                                action: ProductReducer.Action.addToCart
                            )
                        )
                    }
                }
            }
            .padding(20)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    
    static let product = Product(id: 0, title: "Dikke sokk'n", price: 29.99, description: "Dikke sokken", imageString: "soks_image")
    static var previews: some View {
        ProductCell(
            store:
                Store(
                    initialState:
                        ProductReducer.State(
                            id: UUID(),
                            product: product),
                    reducer: ProductReducer()
                )
        )
        .previewLayout(.fixed(width: 200, height: 200))
    }
}
