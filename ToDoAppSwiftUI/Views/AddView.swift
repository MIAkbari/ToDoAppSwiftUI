//
//  AddView.swift
//  ToDoAppSwiftUI
//
//  Created by Mohammad on 2/4/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: ListViewModel
    
    @State var textTextFiled: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here ...", text: $textTextFiled)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.30))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖊")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    private func saveButtonPressed() {
        if textIsApprovaite() {
            viewModel.addItem(textTextFiled)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func textIsApprovaite() -> Bool {
        if textTextFiled.count < 3 {
            alertTitle = "Your new todo item need 3 charecters limit count!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    private func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .navigationSetup()
            .environmentObject(ListViewModel())
    }
}
