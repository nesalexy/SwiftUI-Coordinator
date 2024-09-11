//
//  DetailViewModel.swift
//  SwiftUI+Coordinator
//
//  Created by Alexy Nesterchuk on 11.09.2024.
//

import SwiftUI


final class DetailViewModel: ObservableObject {
    
    @Published var feedItem: FeedViewModel.FeedItem = .init(name: "", age: -1)
    
    private let coordinator: Coordinator
    
    init(coordinator: Coordinator, feedItem: FeedViewModel.FeedItem) {
        self.coordinator = coordinator
        self.feedItem = feedItem
    }
    
    func didCloseTapped() {
        coordinator.dismissSheet()
    }
}


