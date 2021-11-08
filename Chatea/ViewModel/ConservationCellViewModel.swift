//
//  ConservationCellViewModel.swift
//  Chatea
//
//  Created by Ece Ayvaz on 8.11.2021.
//

import SwiftUI
import Firebase

class ConservationCellViewModel : ObservableObject {
    
    //@Published var user: User?
    //let message : Message
    @Published var message: Message
    
    init(message : Message){
        self.message = message
        fetchUser()
    }
    
    var chatPartnerId: String {
        
        return message.fromId == AuthViewModel.shared.userSession?.uid ? message.told: message.fromId
    }
    var chatPartnerProfileImageUrl : URL? {
        guard let user = message.user else {return nil}
        return URL(string: user.profileImageUrl)
    }
    func fetchUser() {
        
        Firestore.firestore().collection("users").document(chatPartnerId).getDocument{snapshot, _ in
            self.message.user = try? snapshot?.data(as:User.self)
            
        }
    }
    
}
