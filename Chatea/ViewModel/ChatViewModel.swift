//
//  ChatViewModel.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import SwiftUI
import Firebase
import Foundation

class ChatViewModel: ObservableObject{
    @Published var messages = [Message]()
    var documentIdArray = [String]()
    let user: User
    init(user : User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages(){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return}
        guard let chatPartnerId = user.id else {return}
        
        Firestore.firestore().collection("messages").document(currentUid).collection(chatPartnerId)
            .order(by:"timestamp", descending: false).addSnapshotListener{ (snapshot , error) in
            if error != nil {} else {
                
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                       // guard let documents = snapshot?.documents else {return }
                        //documents.forEach({print($0.data())})
                        
                        guard let changes = snapshot?.documentChanges.filter({$0.type == .added}) else {return}
                        
                        var messages = changes.compactMap {try? $0.document.data(as:Message.self)}
                        
                        for (index, message) in messages.enumerated() where message.fromId != currentUid {
                            
                            messages [index].user = self.user
                        }
                        //self.messages = messages
                        
                        self.messages.append(contentsOf: messages)
                   
                }
            }
        }
    }

    func sendMessage(_ messageText:String) {
        /* let message = Message(isFromCurrentUser: true, messageText: messageText)
         messages.append(message)*/
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return}
        guard let chatPartnerId = user.id else {return}
        
        let currentUserRef = Firestore.firestore().collection("messages").document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = Firestore.firestore().collection("messages").document(chatPartnerId).collection(currentUid)
        
        let recentUserRef = Firestore.firestore().collection("messages").document(currentUid)
            .collection("recent_messages").document(chatPartnerId)
        let recentPartnerRef = Firestore.firestore().collection("messages").document(chatPartnerId).collection("recent_messages").document(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText, "fromId": currentUid, "told": chatPartnerId, "read": false, "timestamp" : Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)

        recentUserRef.setData(data)
        recentPartnerRef.setData(data)

    }
}
