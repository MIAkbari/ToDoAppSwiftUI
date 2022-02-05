//
//  NoItemView.swift
//  ToDoAppSwiftUI
//
//  Created by Mohammad on 2/5/22.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    private let seccendryAccentColor = Color("SeccendryAccentColor")
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you productive person? I think you should click the add button add and bunch of items to your todo list!")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddView()) {
                    Text("Add Somthing")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : seccendryAccentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? Color.red.opacity(0.7) : seccendryAccentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400) // for landscap size
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    func addAnimation() {
        guard !animate else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemView()
    }
}
