//
//  ItemModels.swift
//  ToDoAppSwiftUI
//
//  Created by Mohammad on 2/5/22.
//

import Foundation

struct ItemModel: Identifiable {
    
    var title: String
    var isComplate: Bool
    var id: String = UUID().uuidString
    
    internal init(id: String = UUID().uuidString, title: String, isComplate: Bool) {
        self.title = title
        self.isComplate = isComplate
        self.id = id
    }
    
    func updateComplated() -> ItemModel {
        ItemModel(id: id, title: title, isComplate: !isComplate)
    }
}
