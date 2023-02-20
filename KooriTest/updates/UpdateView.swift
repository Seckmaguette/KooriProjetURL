//
//  UpdateView.swift
//  KooriTest
//
//  Created by Maguette SECK on 17/02/2023.
//

import SwiftUI

struct UpdateView: View {
    @EnvironmentObject var dataLoad:ViewList

    @State  var editMod = false
   @State var editid:Int

   @State  var editavatar:String =  "https://w0.peakpx.com/wallpaper/88/517/HD-wallpaper-sasuke-anime-ecran-fond-manga-naruto-naruto-shippuden-personnage-uchiwa.jpg"
    @State  var edituserName:String = ""
    @State var editadress:String = ""

   @State var editprofession:String = ""
  @State  var editservice:String = ""
   @State var editdepartement:String = ""
   @State  var editdirection:String = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationView(){
            ZStack{
                VStack{
                    samaTests()
                    monTextfields(editusername: $edituserName)
                    monTextfield2s(editadress: $editadress)
                    monTextfield3s(editprofession: $editprofession)
                    monTextfield4s(editservice: $editservice)
                    monTextfield5s( editdepartement: $editdepartement)
                    monTextfield6s(editdirection: $editdirection)
                  
                    
                        .padding(.vertical, 22.0)
                    Button(action:{
                        
                      
                       
                        
                       
                        print(dataLoad.userList)
                        let user = User (id:editid,avatar:editavatar, nomComplet:edituserName,email:editadress ,profession:editprofession , service: editservice, departement: editdepartement, direction:editdirection )
                        dataLoad.userList.append(user)
                        print("le nbre\(user.id)")
                        
                        print("vous avez ajoutez \([dataLoad.userList]) maintenant je l'evoie sur valider")
//
//
                        if !dataLoad.userList.isEmpty {
//
//
                            
                        print("vous avez modifié le user avec l'ID \(editid)")
                                               }
                                              else {
                                                   print("aucun utilisateur avec l'ID \(editid) trouvé")
                                               }
                        
//
//
                        dataLoad.update(user:user)
                        //        back

                        
                    })
                    {
                        
                        loginConnexions()
                        
                    }
                    

                }
            }
        }
        
//        var leading: some View{
//            Button(action: {
//                self.isShow.toggle()
//
//            }, label:{
//                Text("Back")
//            })
//
        
    }
}

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateView( editid: Int())
    }
}



struct samaTests: View {
    var body: some View {
        Text("Bienvenue au Lab")
            .multilineTextAlignment(.center)
            .fontWeight(.semibold)
            .font(.largeTitle)
            .padding(.bottom,55)
       
       
    
    }
}



struct loginConnexions: View {
    
    var body: some View {
        Text("Modifier")
            .padding()
            .frame(width: 250,height: 50)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(25.0)
    }
    
}

struct  monTextfields: View {
    @Binding var editusername:String
    var body: some View {
        TextField("nomcomplet", text: $editusername)
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


struct  monTextfield2s: View {
    @Binding var editadress:String
    var body: some View {
        TextField("email", text: $editadress)
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

struct  monTextfield3s: View {
    @Binding var editprofession:String
    var body: some View {
        TextField("profession", text: $editprofession)
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

struct  monTextfield4s: View {
    @Binding var editservice:String
    var body: some View {
        TextField("service", text: $editservice)
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

struct  monTextfield5s: View {
    @Binding var editdepartement:String
    var body: some View {
        TextField("departement", text: $editdepartement)
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

struct  monTextfield6s: View {
    @Binding var editdirection:String
    var body: some View {
        TextField("direction", text: $editdirection)
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






