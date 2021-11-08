//
//  MessageViewModel.swift
//  Chatea
//
//  Created by Ece Ayvaz on 1.11.2021.
//

import Firebase

class MessageViewModel : ObservableObject {
    
    @Published var user: User?
    let message: Message
    
    init(message  : Message){
        self.message = message
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser : Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl : URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil}
        return URL(string: profileImageUrl)
    }
    
    var chatPartnerId: String {
        
        return message.fromId == currentUid ? message.told: message.fromId
    }
    var chatPartnerProfileImageUrl : URL? {
        guard let user = user else {return nil}
        return URL(string: user.profileImageUrl)
    }
    func fetchUser() {

        Firestore.firestore().collection("users").document(chatPartnerId).getDocument{snapshot, _ in
            self.user = try? snapshot?.data(as:User.self)
        
    }
}
}
