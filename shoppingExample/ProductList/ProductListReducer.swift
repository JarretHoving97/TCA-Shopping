//
//  ProductListReducer.swift
//  shoppingExample
//
//  Created by Jarret Hoving on 20/06/2023.
//

import Foundation
import ComposableArchitecture

struct ProductListReducer {
    
    // define any effects
    var fetchProducts: @Sendable () async throws -> [Product]
    var sendOrder: @Sendable ([Product]) async throws -> String
}

extension ProductListReducer: ReducerProtocol {
    
    struct State: Equatable {
        var productList: IdentifiedArrayOf<ProductReducer.State> = []
        
        // Keep a status to prevent for not reloading when not needed
        var dataLoadingStatus = DataLoadingStatus.notStarted
    }
    
    
    enum Action: Equatable {
        case fetchProducts
        case fetchProductResponse(TaskResult<[Product]>)
        case product(id: UUID, action: ProductReducer.Action)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            
            switch action {
                
            case .fetchProducts:
                // check if data is not alreadyloading or loaded
                guard state.dataLoadingStatus != .loading || state.dataLoadingStatus != .success else { return .none }
                
                // set loading
                state.dataLoadingStatus = .loading
                
                // send effect and return anotion action
                return .task {
                    await .fetchProductResponse(
                        TaskResult {try await fetchProducts() }
                    )
                }
            case .fetchProductResponse(.success(let products)):
                state.dataLoadingStatus = .success
                
                state.productList = IdentifiedArrayOf(
                    uniqueElements: products.map {
                        ProductReducer.State(
                            id: UUID(),
                            product: $0
                        )
                    }
                )
    
                return .none
                
            case .fetchProductResponse(.failure(let error)):
                
                print(error)
                print("Error getting products, try again later.")
                // received handle en describe here how to handle it.
                state.dataLoadingStatus = .error
                return .none
                
            case .product:
                return .none
            }
            
        }
        .forEach(\.productList, action: /ProductListReducer.Action.product(id:action:)) {
            ProductReducer()
        }
    }
}
