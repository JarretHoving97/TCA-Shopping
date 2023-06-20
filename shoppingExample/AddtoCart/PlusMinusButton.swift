//
//  AddToCartButton.swift
//  shoppingExample
//
//  Created by Jarret Hoving on 20/06/2023.
//

import SwiftUI
import ComposableArchitecture

struct PlusMinusButton: View {
    
    let store: StoreOf<AddToCartReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            
            HStack {
                Button("+") {
                    viewStore.send(.increaseCounter)
                }
                .padding(10)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Text("\(viewStore.count)")
                
                Button("-") {
                    viewStore.send(.decreaseCounter)
                }
                .padding(10)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .frame(height: 40)
    }
}

struct PlusMinusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusMinusButton(store: Store(initialState: .init(), reducer: AddToCartReducer()))
    }
}
