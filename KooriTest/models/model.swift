//
//  model.swift
//  KooriTest
//
//  Created by Maguette SECK on 14/02/2023.
//

import Foundation
struct User: Identifiable, Codable {

let id: Int
let avatar:String
let nomComplet:String

let email:String

    let profession: String
    let service: String
    let departement: String
    let direction: String
    
    
    init(id: Int,avatar: String, nomComplet: String,email: String, profession: String, service: String, departement: String, direction: String) {
        
       
self.id = id
        
       
self.avatar = avatar
        
       
self.nomComplet = nomComplet
        
       
self.email = email
        
       
self.profession = profession
        
       
self.service = service
        
       
self.departement = departement
        
       
self.direction = direction
        
        
        
    }

}

