//
//  AddToCartStore.swift
//  shoppingExample
//
//  Created by Jarret Hoving on 20/06/2023.
//

import Foundation
import ComposableArchitecture

struct PlusMinusReducer: ReducerProtocol {

    struct State: Equatable {
        var count = 0
    }
    
    enum Action: Equatable {
        case increaseCounter
        case decreaseCounter
    }
    
    struct Environment {}
    
    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.EffectTask<Action> {
        switch action {
        case .increaseCounter:
            state.count += 1
            return .none
            
        case .decreaseCounter:
       
            state.count -= 1
            
            return .none
        }
    }
}
