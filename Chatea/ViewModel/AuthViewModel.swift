//
//  AuthViewModel.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import Firebase

class  AuthViewModel: NSObject,ObservableObject {
    func login()  {
        print("Login is trying")
    }
    
    func register(withEmail email: String, password: String )  {
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                print("Failed to register \(error.localizedDescription)")
                return
            }else{
                
            }
        }
  
    }
    
    func uploadImage()  {
        
    }
    
    func logout()  {
        
    }
    
    
}
