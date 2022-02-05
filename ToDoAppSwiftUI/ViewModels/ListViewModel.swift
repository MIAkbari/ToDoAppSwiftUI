//
//  ListViewModel.swift
//  ToDoAppSwiftUI
//
//  Created by Mohammad on 2/5/22.
//

import Foundation


final class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        addData()
    }
    
    private func addData() {
        items = [//.init(title: "This is a first title", isComplate: false),
                 //.init(title: "This is a seccend title", isComplate: true),
                 .init(title: "Thired", isComplate: false)]
        
    }
    
    func deleteItem(_ indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(_ from: IndexSet, _ to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(_ text: String) {
        items.append(.init(title: text, isComplate: false))
    }
    
    func updateItem(_ item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateComplated()
        }
    }
}
