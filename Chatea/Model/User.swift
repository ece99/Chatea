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
    
    
}
