//
//  viewModels.swift
//  KooriTest
//
//  Created by Maguette SECK on 14/02/2023.
//

import Foundation


class ViewList: ObservableObject{
    @Published  var userList: [User] = []
    func loadUserList() {
        guard let userListApiUrl = URL (string:"http://localhost:3000/api/users") else { return}
        let urlSession = URLSession.shared
        var request = URLRequest (url: userListApiUrl)
        request.httpMethod = "GET"
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            guard error == nil,
                  let httpResponse = response as? HTTPURLResponse,
                  let userListJsonData = data else {
                return
            }
            if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                if let downloadedUserList = try? JSONDecoder () .decode ([User].self,from:userListJsonData) {
                  
                    DispatchQueue.main.async {
                        self.userList = downloadedUserList
                
                    }
                }
            }
        }
        
        dataTask.resume ( )
    }
    
//    func addutlisateur( newUser : User){
//
//        userList.append( newUser )
//    }
//    newUser represente l'objet
    func validate(newUser:User){
        
        
        
        
        let url = URL(string: "http://localhost:3000/api/users")!
        
        // create a URLRequest with POST method and JSON content type
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print("voila l'objet\(newUser)")

        // encode the user object as JSON
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(newUser)
        print("je me suis bien encoder")
        
       
        
        // set the JSON data as the HTTP body of the request
        request.httpBody = jsonData
        
        // send the HTTP request and handle the response
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // handle the response here
            if let error = error {print("Error: \(error.localizedDescription)")
            }else if let data = data, let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
                print("Response data: \(String(data: data, encoding: .utf8) ?? "")")
            }
        }
        task.resume()
        
    }
    
    
    
    
    func update(user:User){
        
        // create the URL for the server endpoint, including the ID of the user to update
        let url = URL(string: "http://localhost:3000/api/users/\(user.id)")!
print( url)
        // create a URLRequest with PUT method and JSON content type
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // encode the user object as JSON
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(user)

        // set the JSON data as the HTTP body of the request
        request.httpBody = jsonData

        // send the HTTP request and handle the response
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // handle the response here
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let data = data, let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
                print("Response data: \(String(data: data, encoding: .utf8) ?? "")")
            }
        }
        task.resume()

    }

    
    
}
