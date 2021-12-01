//
//  MockNewMessageService.swift
//  ChateaTests
//
//  Created by Ece Ayvaz on 30.11.2021.
//

import Foundation
@testable import Chatea

struct MockUser : Identifiable, Decodable{
    
    let id: String
    let email: String
    let password: String
    let profileImageUrl: String
}

extension MockUser: FirebaseConvertable {
    init?(from document: [String: Any]) {
        guard let id = document["id"] as? String,
              let email = document["email"] as? String,
              let password = document["password"] as? String,
              let profileImageUrl = document["profileImageUrl"] as? String else { return nil }
        
        self.init(id: id, email: email, password: password , profileImageUrl: profileImageUrl)
    }
    
    func toDocument() -> [String : Any] {
        [ "id": self.id,
          "email": self.email,
          "password": self.password,
          "profileImageUrl": self.profileImageUrl]
    }
}

final class MockNewMessageService : NewMessageServiceProtocol {
    
    let testUser : [User]
    
    init(testUser: [User]?){
        self.testUser = testUser ?? [User(id:"1234567890",email: "ege@gmail.com", password: "123456789",profileImageUrl: "www.pinterest.com")]
    }
    
    
    func fetchUser(_ completion: @escaping GetUsersCompletionHandler) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            completion(self.testUser)
        }
    }
}
   
