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
    
    var user: User?
    
    
    /*  init(id:String = "" , fromId:String = "", told:String =  "",read: Bool = false, text:String = "" ,timestamp: Timestamp.init(seconds: Int64(sd), nanoseconds: Int32(nd)) , user: User = MOCK_USER){
     
     self.id = id
     self.fromId = fromId
     self.told = told
     self.read = read
     self.text = text
     self.timestamp = timestamp
     self.user = user
     
     }*/
    
    
}

var MOCK_MESSAGE = Message(id: "12345", fromId:"123" , told: "321", read: true, text: "Heyyo",timestamp: Timestamp(date: Date()), user: MOCK_USER)
