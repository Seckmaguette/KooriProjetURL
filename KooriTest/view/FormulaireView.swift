//
//  FormulaireView.swift
//  KooriTest
//
//  Created by Maguette SECK on 14/02/2023.
//

import SwiftUI

struct FormulaireView: View {
    @EnvironmentObject var dataLoad:ViewList
    //        back

    @Binding var isShow:Bool
    
//    @State var id:String = ""
//    @State var avatar:String = ""
    @State var id:Int = 1
    @State var userName:String = ""
    @State var name:String = ""
    @State var avatar:String = "https://w0.peakpx.com/wallpaper/88/517/HD-wallpaper-sasuke-anime-ecran-fond-manga-naruto-naruto-shippuden-personnage-uchiwa.jpg"
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        NavigationView() {
        ZStack{
            VStack {
            
                    samaTest()
                
                    monTextfield(username: $userName)
                    monTextfield2(name: $name)
                  
                    
                        .padding(.vertical, 22.0)
                    
                    
                    
                    Button(action:{
                        
                        print(dataLoad.userList)
                        let newUser = User (id:id, prenom:userName, nom:name,avatar:avatar )
                        dataLoad.userList.append(newUser)
                        print("vous avez ajoutez \([dataLoad.userList]) maintenant je l'evoie sur valider")

                        dataLoad.validate(newUser: newUser)
                        //        back

                        self.isShow.toggle()
                        
                    })
                    {
                        
                        loginConnexion()
                        
                    }
                    
                }
                
                
                
                //            fermuture vStack
                .padding()
            }
        .navigationTitle("New Contact")
            //        back

        .navigationBarItems(leading:leading)

        }
    }
    //        back

    var leading: some View{
        Button(action: {
            self.isShow.toggle()
            
        }, label:{
            Text("Back")
        })
        
    }
}

struct FormulaireView_Previews: PreviewProvider {
    static var previews: some View {
//        back
        FormulaireView(isShow: .constant(Bool()))
    }
}




struct samaTest: View {
    var body: some View {
        Text("Bienvenue au Lab")
            .multilineTextAlignment(.center)
            .fontWeight(.semibold)
            .font(.largeTitle)
            .padding(.bottom,55)
       
       
    
    }
}



struct loginConnexion: View {
    var body: some View {
        Text("Enregistrer")
            .padding()
            .frame(width: 250,height: 50)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(25.0)
    }
}

struct  monTextfield: View {
    @Binding var username:String
    var body: some View {
        TextField("nomcomplet", text: $username)
            .frame(height: 45)
            .frame(width: 260)

            .overlay( RoundedRectangle(cornerRadius:5)
            .strokeBorder(Color.black,lineWidth: 2))
//            .padding()
//            .border(.black)
//            .padding(.bottom,20.0)
//            .frame(width: 355, height: 75)
            .foregroundColor(Color.black)
            
//            .textFieldStyle(.roundedBorder)
            .background(Color.white)
//            .cornerRadius(35)
    }
}


struct  monTextfield2: View {
    @Binding var name:String
    var body: some View {
        TextField("nom", text: $name)
            .frame(height: 45)
            .frame(width: 260)

            .overlay( RoundedRectangle(cornerRadius:5)
            .strokeBorder(Color.black,lineWidth: 2))
//            .padding()
//            .border(.black)
//            .padding(.bottom,20.0)
//            .frame(width: 355, height: 75)
            .foregroundColor(Color.black)
            
//            .textFieldStyle(.roundedBorder)
            .background(Color.white)
//            .cornerRadius(35)
        
        
        
    }
}






