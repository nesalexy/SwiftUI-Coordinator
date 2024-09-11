//
//  FeedView.swift
//  SwiftUI+Coordinator
//
//  Created by Alexy Nesterchuk on 11.09.2024.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel: FeedViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center) {
                ForEach(viewModel.items, id: \.self) { item in
                    VStack {
                        Text(item.name)
                        Text("age: \(item.age)")
                    }
                    .padding()
                    .onTapGesture {
                        viewModel.didTapItem(with: item)
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView(viewModel: .init(coordinator: Coordinator()))
}
