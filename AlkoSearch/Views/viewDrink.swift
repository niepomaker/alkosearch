//
//  ContentView.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 17/11/2022.
//

import SwiftUI

struct viewDrink: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var value: String = ""
    var drinkID: String = ""
    var drinkName: String = ""
    var drinkImage: String = ""
    var drinkCom0: String = ""
    var drinkCom1: String = ""
    var drinkCom2: String = ""
    var drinkCom3: String = ""
    var drinkCom4: String = ""
    var drinkCom5: String = ""
    var drinkCom6: String = ""
    var drinkCom7: String = ""
    var drinkCom8: String = ""
    var drinkCom9: String = ""
    
    var body: some View {

        NavigationView{
            ZStack(alignment: .top){
                Image("background").resizable().ignoresSafeArea()
                VStack{
                    Text(drinkName.capitalized)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.white)
                    Image(drinkImage)
                        .resizable()
                        .frame(width: 300,height: 300)
                    List {
                        Text(drinkCom0)
                            .font(.title2)
                            .foregroundColor(Color.blue)
                        Text(drinkCom1)
                            .font(.title2)
                            .foregroundColor(Color.blue)
                        Text(drinkCom2)
                            .font(.title2)
                            .foregroundColor(Color.blue)
                        if(drinkCom3 != "") {
                            Text(drinkCom3)
                                .font(.title2)
                                .foregroundColor(Color.blue)
                        }
                        if(drinkCom4 != "") {
                            Text(drinkCom4)
                                .font(.title2)
                                .foregroundColor(Color.blue)
                        }
                        if(drinkCom5 != "") {
                            Text(drinkCom5)
                                .font(.title2)
                                .foregroundColor(Color.blue)
                        }
                        if(drinkCom6 != "") {
                            Text(drinkCom6)
                                .font(.title2)
                                .foregroundColor(Color.blue)
                        }
                        if(drinkCom7 != "") {
                            Text(drinkCom7)
                                .font(.title2)
                                .foregroundColor(Color.blue)
                        }
                        if(drinkCom8 != "") {
                            Text(drinkCom8)
                                .font(.title2)
                                .foregroundColor(Color.blue)
                        }
                        if(drinkCom9 != "") {
                            Text(drinkCom9)
                                .font(.title2)
                                .foregroundColor(Color.blue)
                        }
                            
                    }
                    .frame(width: 400, height: 250)
                    .cornerRadius(20)
                }
                
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        }
    }
}

                    
        


struct viewDrink_Previews: PreviewProvider {
    static var previews: some View {
        viewDrink()
    }
}


