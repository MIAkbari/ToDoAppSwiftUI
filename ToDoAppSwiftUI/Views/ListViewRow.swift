//
//  ListViewRow.swift
//  ToDoAppSwiftUI
//
//  Created by Mohammad on 2/4/22.
//

import SwiftUI

struct ListViewRow: View {
    
    var item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isComplate ? "checkmark.circle": "circle")
                .foregroundColor(item.isComplate ? .green: .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListViewRow_Previews: PreviewProvider {
    
    static let item: ItemModel = .init(title: "This a title", isComplate: false)
    static let itemTwo: ItemModel = .init(title: "This a title", isComplate: true)
    static var previews: some View {
        Group {
            ListViewRow(item: item)
            ListViewRow(item: itemTwo)
        }
        .previewLayout(.sizeThatFits)
    }
}
