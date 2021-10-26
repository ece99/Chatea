//
//  ChatView.swift
//  Chatea
//
//  Created by Ece Ayvaz on 25.10.2021.
//

import SwiftUI

struct ChatView: View {
    
    @State private var messageText = ""
    @ObservedObject var viewModel = ChatViewModel()

    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 12){
                    ForEach(viewModel.messages){ message in
                        MessageView(isFromCurrentUser: message.isFromCurrentUser, messageText: message.messageText)
                    }
                }
            }
            CustomInputView(text: $messageText, action: sendMessage)
           
        }
    }
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
