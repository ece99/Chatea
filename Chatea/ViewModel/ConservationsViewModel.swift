//
//  ConservationsViewModel.swift
//  Chatea
//
//  Created by Ece Ayvaz on 8.11.2021.
//

import SwiftUI
import Firebase

class ConservationsViewModel : ObservableObject{
    @Published var recentMessages = [Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        Firestore.firestore().collection("messages").document(uid).collection("recent_messages").order(by:"timestamp",descending:false).addSnapshotListener{snapshot,_ in
            
            guard let documents = snapshot?.documents else {return}
            
            self.recentMessages = documents.compactMap({ try? $0.data(as: Message.self)})
            
        }
        
    }
}
