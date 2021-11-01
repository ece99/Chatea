//
//  ChatViewModel.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject{
    @Published var messages = [Message]()
    let user: User
    
    init(user : User) {
       // messages = mockMessages
        self.user = user
    }
    
   /* var mockMessages: [Message]{
        [
            .init(isFromCurrentUser: true, messageText:"Hey"),
            .init(isFromCurrentUser: false, messageText:"What's up"),
            .init(isFromCurrentUser: true, messageText:"Fine"),
            .init(isFromCurrentUser: false, messageText:"OK")
                  
        ]
    }*/
    
    func sendMessage(_ messageText:String) {
       /* let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)*/
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return}
        guard let chatPartnerId = user.id else {return}
        
        let currentUserRef = Firestore.firestore().collection("messages").document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = Firestore.firestore().collection("messages").document(chatPartnerId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText, "fromId": currentUid, "told": chatPartnerId, "read": false]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
        
    }
}
