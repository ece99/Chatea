//
//  AuthService.swift
//  Chatea
//
//  Created by Ece Ayvaz on 18.11.2021.
//

import Foundation
import Firebase

final class AuthService : ObservableObject, AuthServiceProtocol {
    

    @Published var didAuthenticationUser = false
    @Published var userSession : FirebaseAuth.User?
    private var tempCurrentUser: FirebaseAuth.User?
    static let share = AuthService()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email , password: password){ result, error in
            print(result)
            if let error = error{
                completion(.failure(error))
                print("Failed to login \(error.localizedDescription)")
                //return
            } else {
                self.userSession = result?.user
                self.fetchUser()
                print("Login completed")
                completion(.success((true)))
            }
            
        }
    }
    
    func register(withEmail email: String, password: String )  {
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                print("Failed to register \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else{return}
            self.tempCurrentUser = user
            
            let  data: [String:Any] = ["email": email, "password":password]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                self.didAuthenticationUser = true
                
            }
            
            
        }
  
    }
    
    func uploadImage()  {
     
    }
    
    func logout()  {
        self.userSession = nil
        try? Auth.auth().signOut()
        
    }
    
    
    /*func register(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                print("Failed to register \(error.localizedDescription)")
                return
            } else{
                guard let user = result?.user else{return}
                self.tempCurrentUser = user
                
                let  data: [String:Any] = ["email": email, "password":password]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                    self.didAuthenticationUser = true
                }
            }
            
        }
        
    }*/
    


    /*func logout()  {
        self.userSession = nil
        try? Auth.auth().signOut()
        
    }*/
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return}
        Firestore.firestore().collection("users").document(uid).getDocument{snapshot, _ in
            //guard let data = snapshot?.data() else { return}
            guard let user = try? snapshot?.data(as:User.self) else { return}
            //print("DEBUG User object is \(user)")
        }
    }
}
