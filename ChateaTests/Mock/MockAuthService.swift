//
//  MockAuthService.swift
//  ChateaTests
//
//  Created by Ece Ayvaz on 17.11.2021.
//

import Foundation
@testable import Chatea

final class MockAuthService {
   
    
    var user = User(id: "12345", email: "@gmail", password: "12345", profileImageUrl: "www.pinterest.com")
    
    func login(withEmail email: String, password: String) {
        if case user.email = ""{
                print("Failed to login")
                return
            } else {
                print("Login completed")
            }
    }
    
    func register(withEmail email: String, password: String) {
       
    }
    
    func logout(){
    }
    
    func fetchUser() {
        
    }
    
    
    
}
