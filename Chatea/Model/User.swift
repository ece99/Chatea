//
//  User.swift
//  Chatea
//
//  Created by Ece Ayvaz on 27.10.2021.
//

import FirebaseFirestoreSwift

struct User : Identifiable, Decodable{
    
    @DocumentID var id: String?
    let email: String
    let password: String
    let profileImageUrl: String
    
    init(id:String = "" , email:String = "", password:String =  "",profileImageUrl: String = ""){
        
        self.id = id
        self.email = email
        self.password = password
        self.profileImageUrl = profileImageUrl
        
    }
    
}


let MOCK_USER = User(id:"1234567890",email: "ege@gmail.com", password: "123456789",profileImageUrl: "www.pinterest.com")
