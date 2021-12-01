//
//  NewMessageViewModel.swift
//  Chatea
//
//  Created by Ece Ayvaz on 27.10.2021.
//

import SwiftUI
import Firebase
import Combine
import CoreMedia

class NewMessageViewModel: ObservableObject{
    @Published var users = [User]()
    private let newMessageService: NewMessageServiceProtocol
    
    init( newMessageService: NewMessageServiceProtocol = NewMessageService()){
        
        self.newMessageService = newMessageService
       send()
    }
    
    func send() {
        newMessageService.fetchUser(){ returnItems in
            self.users = returnItems
        }
        
    }
    
   /* func fetchUsers() {
        
        Firestore.firestore().collection("users").getDocuments{ snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }

            self.users = documents.compactMap({try? $0.data(as: User.self)}).filter({$0.id != AuthViewModel.shared.userSession?.uid})
            print("DEBUG \(self.users)")

        }
    }*/
    
}
