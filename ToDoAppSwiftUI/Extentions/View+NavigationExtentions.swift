//
//  View+NavigationExtentions.swift
//  ToDoAppSwiftUI
//
//  Created by Mohammad on 2/4/22.
//

import SwiftUI

extension View {
    func navigationSetup() -> NavigationView<Self> {
        NavigationView {
            self
        }
    }
}
