//
//  ConservationView.swift
//  Chatea
//
//  Created by Ece Ayvaz on 25.10.2021.
//

import SwiftUI

struct ConservationView: View {
    @State private  var showChatView = false
    @State var selectedUser: User?
    var body: some View {
            VStack(alignment: .leading){
                if let user = selectedUser {
                    NavigationLink(
                        destination: ChatView(user: user),
                        isActive: $showChatView,
                        label: {
                        })
                }

                NewMessageView(showChatView: $showChatView, user: $selectedUser)

            ScrollView{
                //user cell
                //chats
                VStack(alignment: .leading){
                    HStack  {Spacer()}
                    ForEach((0 ... 20), id:\.self){ _ in
                        NavigationLink(
                            destination: ChatView(user: MOCK_USER),
                            label: {
                                ConservationCell()
                            })
                    }
                }
            }

        }
    }
            
    }


struct ConservationView_Previews: PreviewProvider {
    static var previews: some View {
        ConservationView()
    }
}
