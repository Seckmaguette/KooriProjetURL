//
//  model.swift
//  KooriTest
//
//  Created by Maguette SECK on 14/02/2023.
//

import Foundation
struct User: Identifiable, Codable {

let id: Int

let prenom:String

let nom:String
let avatar:String
    
    
    init(id: Int,prenom:String ,nom: String,avatar: String) {
        
        
        self.id = id
        

        self.prenom = prenom

        self.nom = nom
        
        self.avatar = avatar
        
        }

}


