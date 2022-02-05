//
//  ToDoAppSwiftUIApp.swift
//  ToDoAppSwiftUI
//
//  Created by Mohammad on 2/4/22.
//

import SwiftUI

/*
 if need lunch screen check info plist
 and can remove lunch screen from plist and make lunch screen from storyboard
 */
@main
struct ToDoAppSwiftUIApp: App {
    
    @StateObject var viewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .navigationSetup()
                .navigationViewStyle(StackNavigationViewStyle()) // is use tablet size
                .environmentObject(ListViewModel())
        }
    }
}
