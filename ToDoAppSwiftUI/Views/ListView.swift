//
//  ContentView.swift
//  ToDoAppSwiftUI
//
//  Created by Mohammad on 2/4/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel: ListViewModel
    
    var body: some View {
        VStack {
            if viewModel.items.isEmpty {
                NoItemView()
            } else {
                List {
                    ForEach(viewModel.items) { item in
                        ListViewRow(item: item)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.updateItem(item)
                                }
                            }
                        
                    }
                    .onDelete(perform: viewModel.deleteItem)
                    .onMove(perform: viewModel.moveItem)
                }
            }
        }
        .navigationBarTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView()
                .navigationSetup()
                .preferredColorScheme(.light)
                .environmentObject(ListViewModel())
            
            ListView()
                .navigationSetup()
                .preferredColorScheme(.dark)
                .environmentObject(ListViewModel())
        }
    }
}
