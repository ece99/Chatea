//
//  AuthViewModel.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import Firebase

class  AuthViewModel: NSObject,ObservableObject {
    
    @Published var didAuthenticationUser = false
    @Published var userSession : FirebaseAuth.User?

    static let shared = AuthViewModel()
    private var tempCurrentUser: FirebaseAuth.User?
    
    override init() {
        super.init()
        
        userSession = Auth.auth().currentUser
        
        fetchUser()
    }
    
    func login(withEmail email: String , password: String)  {
        Auth.auth().signIn(withEmail: email , password: password){ result, error in
            if let error = error{
                print("Failed to login \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
            self.fetchUser()

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
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return}
        
        Firestore.firestore().collection("users").document(uid).getDocument{snapshot, _ in
            //guard let data = snapshot?.data() else { return}
            guard let user = try? snapshot?.data(as:User.self) else { return}
       
            print("DEBUG User object is \(user)")
        }
    }
    
    
}
