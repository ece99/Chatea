//
//  ChatViewModel.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import Foundation

class ChatViewModel: ObservableObject{
    @Published var messages = [Message]()
    
    init() {
        messages = mockMessages
    }
    
    var mockMessages: [Message]{
        [
            .init(isFromCurrentUser: true, messageText:"Hey"),
            .init(isFromCurrentUser: false, messageText:"What's up"),
            .init(isFromCurrentUser: true, messageText:"Fine"),
            .init(isFromCurrentUser: false, messageText:"OK")
                  
        ]
    }
    func sendMessage(_ messageText:String) {
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
}
