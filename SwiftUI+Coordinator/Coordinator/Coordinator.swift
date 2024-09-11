//
//  Coordinator.swift
//  SwiftUI+Coordinator
//
//  Created by Alexy Nesterchuk on 11.09.2024.
//

import SwiftUI

enum Page: String, Identifiable {
    case login
    case feed
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: Identifiable {
    case detail(item: FeedViewModel.FeedItem)
    
    var id: String {
        switch self {
        case .detail(let item):
            return item.id
        }
    }
}


class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .login:
            let viewModel = LoginViewModel(coordinator: self)
            LoginView(viewModel: viewModel)
        case .feed:
            let viewModel = FeedViewModel(coordinator: self)
            FeedView(viewModel: viewModel)
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .detail(let item):
            let viewModel = DetailViewModel(coordinator: self, feedItem: item)
            DetailSheetView(viewModel: viewModel)
        }
    }
}

