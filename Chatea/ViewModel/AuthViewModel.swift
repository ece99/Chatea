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
            }
            guard let user = result?.user else{return}
            let  data: [String:Any] = ["email": email, "password":password]
            Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                print("Succesfully added")
                
            }
            
            
        }
  
    }
    
    func uploadImage()  {
        
    }
    
    func logout()  {
        
    }
    
    
}
