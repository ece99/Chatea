//
//  ConservationView.swift
//  Chatea
//
//  Created by Ece Ayvaz on 25.10.2021.
//

import SwiftUI

struct ConservationView: View {
    @State private  var showChatView = false
    var body: some View {
            ZStack(alignment: .bottomTrailing){
            
            NavigationLink(
                destination: ChatView(),
                isActive: $showChatView,
                label: {
                })

            ScrollView{
                //user cell
                NewMessageView(showChatView: $showChatView)
                //chats
                VStack(alignment: .leading){
                    HStack  {Spacer()}
                    ForEach((0 ... 10), id:\.self){ _ in
                        NavigationLink(
                            destination: ChatView(),
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
