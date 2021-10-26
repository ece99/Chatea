//
//  Message.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import Foundation

struct Message: Identifiable{
    
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
}
