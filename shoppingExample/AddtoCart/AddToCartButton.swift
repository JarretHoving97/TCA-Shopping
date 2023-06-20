//
//  AddToCartButton.swift
//  shoppingExample
//
//  Created by Jarret Hoving on 20/06/2023.
//

import SwiftUI
import ComposableArchitecture

struct AddToCartButton: View {
    
    let store: StoreOf<AddToCartReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            if viewStore.state.count > 0 {
                PlusMinusButton(store: self.store )
            } else {
                Button {
                    viewStore.send(.increaseCounter)
                } label: {
                    Text("Add to Cart")
                        .padding(10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct AddToCartButton_Previews: PreviewProvider {

    static var previews: some View {
        AddToCartButton(store: Store(initialState: .init(),
                                     reducer: AddToCartReducer()))
    }
}
