//
//  Message.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Decodable{
    
    @DocumentID var id: String?
    let fromId: String
    let told: String
    let read: Bool
    let text: String
    let timestamp : Timestamp
    
    /* let id = NSUUID().uuidString
     let isFromCurrentUser: Bool
     let messageText: String*/
    
}
