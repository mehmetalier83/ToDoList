//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Mehmet Ali Er on 11.06.2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate :Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing:10){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you productive person? I think you should click the add button and add a bunch of items to your  todo list!")
                    .padding(.bottom,20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add something 😎")})
                        .scaleEffect(animate ? 1.1 : 1.0)
                        .padding(animate ? 30: 50)
                        .offset( y: animate ? -7: 0)
                .foregroundColor(.white)
                .font(.headline)
                .frame(height:55)
                .frame(maxWidth:.infinity)
                .background(animate ? Color.red : Color.accentColor)
                .cornerRadius(10)
                .shadow(color: animate ? Color.red.opacity(0.7): Color.blue.opacity(0.7), radius: animate ? 30 : 10 , x: 0, y: animate ? 50 : 30 )
                
            }.multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }
    }
    func addAnimation(){
        guard !animate else {return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation.easeOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView().navigationTitle("Title")
        }
        
    }
}
