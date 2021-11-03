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
    var array = [String]()
    let user: User
    init(user : User) {
        // messages = mockMessages
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages(){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return}
        guard let chatPartnerId = user.id else {return}
        
        Firestore.firestore().collection("messages").document(currentUid).collection(chatPartnerId).addSnapshotListener{ (snapshot , error) in
            if error != nil {
                
                print(error?.localizedDescription)
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    //self.messages.removeAll(keepingCapacity: false)
                    for document in snapshot!.documents {
                        
                        let documentID = document.documentID
                        self.documentIdArray.append(documentID)
                        
                        let currentIndex = self.documentIdArray.count
                        //print(currentIndex)
                        guard let documents = snapshot?.documents else {return }
                        documents.forEach({print($0.data())})
                        self.messages = documents.compactMap {doc in
                            return try? doc.data(as:Message.self)}
                    }
                }
            }
        }
    }
    /*func fetchActiveMessages(){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return}
        guard let chatPartnerId = user.id else {return}

        
        Firestore.firestore().collection("messages").addSnapshotListener{ (snapshot, error) in
            if error != nil {
                
                print(error?.localizedDescription)
            } else {
                
                guard let collection = snapshot?.documents else {return}
                collection.forEach({print($0.data())})
                //for document in collection
                
            }
        }
        
    }*/
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
    
    let data: [String: Any] = ["text": messageText, "fromId": currentUid, "told": chatPartnerId, "read": false, "timestamp" : Timestamp(date: Date())]
    
    currentUserRef.setData(data)
    chatPartnerRef.document(messageId).setData(data)
    
}
}
