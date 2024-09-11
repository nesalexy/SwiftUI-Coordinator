//
//  DetailView.swift
//  SwiftUI+Coordinator
//
//  Created by Alexy Nesterchuk on 11.09.2024.
//

import SwiftUI

struct DetailSheetView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.feedItem.name)
            Text("\(viewModel.feedItem.age)")
            Button {
                viewModel.didCloseTapped()
            } label: {
                Text("Dismiss")
            }
        }
    }
}

#Preview {
    DetailSheetView(viewModel: .init(coordinator: Coordinator(), feedItem: .init(name: "test", age: 1)))
}
