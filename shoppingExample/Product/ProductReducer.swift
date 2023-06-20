//
//  ProductReducer.swift
//  shoppingExample
//
//  Created by Jarret Hoving on 20/06/2023.
//

import Foundation
import ComposableArchitecture

struct ProductReducer: ReducerProtocol {
    
    struct State: Equatable, Identifiable {
        let id: UUID
        let product: Product
        var addToCartState = AddToCartReducer.State()
        
        var count: Int {
            get { addToCartState.count }
            set { addToCartState.count = newValue }
        }
    }
    
    enum Action: Equatable {
        case addToCart(AddToCartReducer.Action)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Scope(state: \.addToCartState, action: /ProductReducer.Action.addToCart) {
            AddToCartReducer()
        }
        
        Reduce { state, action in
            switch action {
            case .addToCart(.increaseCounter):
                return .none
                
            case .addToCart(.decreaseCounter):
                state.addToCartState.count = max(0, state.addToCartState.count)
                return .none
            }
        }
    }
}
