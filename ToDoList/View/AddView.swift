//
//  AddView.swift
//  ToDoList
//
//  Created by Mehmet Ali Er on 24.05.2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentaionMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText )
                    .padding(.horizontal)
                    .frame(height:55 )
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10.0)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(Color.white)
                        .frame(width: 100,height: 55 , alignment: .center  )
                        .background(Color.accentColor)
                        .cornerRadius(20)
                })
            }.padding(14)
        }
        .navigationTitle("Add an Item 🖊")
        .alert(isPresented: $showAlert, content: getAlert)
        }
    func saveButtonPressed(){
        if textisApporiate() == true{
            listViewModel.addItem(title: textFieldText)
            presentaionMode.wrappedValue.dismiss()
        }
       
    }
   
    func  textisApporiate() -> Bool{
        
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long! 🥲 "
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }.environmentObject(ListViewModel())
    }
}
