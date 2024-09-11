//
//  FeedViewModel.swift
//  SwiftUI+Coordinator
//
//  Created by Alexy Nesterchuk on 11.09.2024.
//

import SwiftUI



final class FeedViewModel: ObservableObject {
    
    struct FeedItem: Hashable {
        let id: String = UUID().uuidString
        let name: String
        let age: Int
    }
    
    @Published var items: [FeedItem] = (1...20).map { .init(name: "Cat #\($0)", age: $0) }
    
    private let coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func didTapItem(with item: FeedItem) {
        coordinator.present(sheet: .detail(item: item))
    }
    
}

