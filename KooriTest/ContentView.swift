
import SwiftUI


struct ContentView: View {
    @StateObject var dataLoad:ViewList=ViewList()
//    public var   loginConnexions: Bool
   
//    @State private var showModal=false
    @State private var isShow=false
    
    var body: some View {
  
            Text("LIfe Of Koori")
                .font(.largeTitle)
                .fontWeight(.bold)
        
            
     
      
            NavigationView{
                ZStack{
                    
                    List {
                        ForEach(dataLoad.userList, id: \.id) {   user in
                            
                            NavigationLink(destination: UpdateView(editid:user.id, edituserName: user.nomComplet,editadress: user.email,editprofession: user.profession,editservice: user.service,editdepartement:user.departement,editdirection: user.direction) ,label:{
                                HStack{
                                    
                                
                                    HStack{
                                        AsyncImage(url: URL(string: "\(user.avatar)")) { image in
                                            image.resizable()
                                                .frame(width:50, height: 50)
                                            
                                                .clipped()
                                                .aspectRatio(contentMode: .fill)
                                                .cornerRadius(150)
                                                .padding(.bottom,3)
                                            
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 50, height: 50)
                                        
                                        Text (user.nomComplet )
                                        Spacer()
                                        Text (user.departement )
                                        
                                    }
                                    
                                    
                                    
                                    //                      //
                                    
                                    
                                    //
                                    
                                    
                                }
                                
                            })
                            
                            //
                            //
                        }
                        .onDelete(perform: deletePost)
                    
                }
                
            }.padding ()
                
                    .navigationBarItems(trailing:Button(action: {
                        self.isShow.toggle()
                        
                    }, label:{
                        Image(systemName: "plus.circle")
                    }))

                    .sheet(isPresented: $isShow) {
                        FormulaireView(isShow : self.$isShow, id: Int())
                    }
                        
                    .background(.gray)
             
        }
      
          
      
       
          
       
            .onAppear {
                self.dataLoad.loadUserList()

                
            }
//
//        Button(" SignUp") {
//                 self.showModal = true
//             }
//             .sheet(isPresented: $showModal) {
//                 FormulaireView()
//             }
        
//    .padding(.top,300)
            .environmentObject(dataLoad)
        
        }
    func deletePost(indexSet : IndexSet){
        let id = indexSet.map{dataLoad.userList[$0].id}
                print(id)
                DispatchQueue.main.async {
                    let parameters : [String :Any] = ["id":id[0]]
                    
                    print(parameters["id"])
                    self.dataLoad.deletePost(parameters: parameters, id: parameters["id"] as! Int)
                    //self.userViewModel.fetchPost()
                }
            }

        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( )
//    loginConnexions: Bool()
            
    }
}
