
import SwiftUI


struct ContentView: View {
    @StateObject var dataLoad:ViewList=ViewList()
//    @State private var showModal=false
    @State private var isShow=false
    
    var body: some View {
  
            Text("LIfe Of Koori")
                .font(.largeTitle)
                .fontWeight(.bold)
        
            
     
      
            NavigationView{
                ZStack{
                    List (dataLoad.userList) { user in
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
                            
                            Text (user.prenom )
                       
                            Spacer()
                            Text (user.nom )
    
                        }
                      
                    
                }
                
            }.padding ()
                
                    .navigationBarItems(trailing:Button(action: {
                        self.isShow.toggle()
                        
                    }, label:{
                        Image(systemName: "plus.circle")
                    }))

                    .sheet(isPresented: $isShow) {
                        FormulaireView(isShow : self.$isShow)
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
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
