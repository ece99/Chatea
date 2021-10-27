//
//  NewMessageViewModel.swift
//  Chatea
//
//  Created by Ece Ayvaz on 27.10.2021.
//

import SwiftUI
import Firebase

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers() {
        
        Firestore.firestore().collection("users").getDocuments{ snapshot, _ in
            
            guard let documents = snapshot?.documents else { return}
                    
            documents.forEach{ document in
                guard let user = try? document.data(as: User.self) else {return}
                self.users.append(user)
            }
            print("DEBUG \(self.users)")

        }
    }
    
}
