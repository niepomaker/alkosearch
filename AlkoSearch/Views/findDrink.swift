import SwiftUI
let alkohole = ["wódka", "wódka żurawinowa", "gin", "rum", "biały rum", "malibu rum", "whisky", "likier blue curacao", "wytrawny wermut martini", "wermut martini słodki","jagermeister", "likier Cointreau", "tequila", "likier pomarańczowy","likier triple sec", "aperol"]
let nieAlkohole = ["woda gazowana", "sok pomarańczowy", "sok grejfrutowy", "sok z cytryny", "syrop cukrowy", "grenadyna", "sok z limonki", "coca-cola", "sprite", "fanta", "tonic", "energetyk", "sok ananasowy", "sok bananowy", "sok pomidorowy", "tabasco"]

struct findDrink: View {
    @State var skladniki: [String] = []
//    var allDrinks = Chec
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background").resizable().ignoresSafeArea()
                VStack{
                    Text("Składniki").font(.largeTitle).bold().foregroundColor(.white)
                    Form {
                        Section("Napoje alkoholowe", content: { 
                            List(alkohole, id: \.self) { item in
                                ScrollView {
                                    Button(action: {
                                        if(!skladniki.contains(item)){
                                            skladniki.append(item)
                                        }
                                    }){
                                        Image(systemName: "plus")
                                        Text(item).font(.title3)
                                    }.buttonStyle(.plain)
                                }
                            }
                        })
                    }.frame(width: 375, height: 200)
                        .cornerRadius(20)
                    Form {
                        
                        Section("Napoje niealkoholowe", content: {
                            List(nieAlkohole, id: \.self) { item in
                                Button(action: {
                                    if(!skladniki.contains(item)){
                                        skladniki.append(item)
                                    }
                                }){
                                    Image(systemName: "plus")
                                    Text(item).font(.title3)
                                }.buttonStyle(.plain)
                                
                            }
                        })
                    }.frame(width: 375, height: 200)
                        .cornerRadius(20)
                    Form {
                        
                        Section("Twoje składniki", content: {
                            ForEach(skladniki, id: \.self) { item in
                                Button(action: {
                                    guard let index = self.skladniki.firstIndex(of: item) else { return }
                                    self.skladniki.remove(at: index)
                                }, label: {
                                    HStack{Image(systemName: "minus")
                                        Text(item).font(.title3)}
                                    
                                })}
                            }
                        )
                    }
                    .frame(width: 375, height: 200)
                    .cornerRadius(20)
                    
                    HStack{
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }){
                            Text("Powrót")
                                .frame(width: 175,height: 50)
                                .background(Color(hue: 1.0, saturation: 0.682, brightness: 1.0))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .font(.title)
                                .bold()
                                .padding(.top, 10)
                        }.buttonStyle(.plain)
                        Spacer()
                        NavigationLink(destination: listDrinks(listOfComponenets: $skladniki)){
                            Text("Szukaj")
                                .frame(width: 175,height: 50)
                                .background(Color(red: 0.412, green: 0.399, blue: 1.0))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding(.top, 10)
                                .bold()
                                .font(.title)
                        }.buttonStyle(.plain)
                            .accentColor(.white)
                    }.frame(width: 350)
                }
            }
        }.accentColor(.black)
            .navigationBarBackButtonHidden(true)
    }
}

struct findDrink_Previews: PreviewProvider {

    static var previews: some View {
        findDrink()
    }
}
