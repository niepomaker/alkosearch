//
//  ContentView.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 17/11/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var modelGin = ViewModel()
    @ObservedObject var modelJager = ViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                NavigationLink{
                    mainView()
                } label:{
                    HStack{
                        Text("AlkoSearch")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding(.top, 15.0)
                            
                        Image(systemName: "wineglass.fill")
                            .foregroundColor(Color.black)
                            .padding(.top, 15.0)
                            .font(.largeTitle)
                    }
                    
                }
                
                List (modelGin.list) { item in
                    HStack{
                        Image(item.image)
                            .resizable()
                            .frame(width: 100,height: 100)
//                            .shadow(radius: 10)
                        Text(item.name)
                            .font(.title2)
                            .foregroundColor(Color.black)
                            .padding(/*@START_MENU_TOKEN@*/.vertical, 10.0/*@END_MENU_TOKEN@*/)
                    }
                }
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    
                }){
                    Text("Powrót")
                        .frame(width: 200,height: 50)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .font(.title2)
                }
            }
            
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    init(){
        modelGin.getDrinks("drinksGin")
        modelJager.getDrinks("drinksJager")
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
