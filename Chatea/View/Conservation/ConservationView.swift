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
    @ObservedObject var viewModel =  ConservationsViewModel()
    
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
                
                VStack(alignment: .leading){
                    HStack  {Spacer()}
                    ForEach(viewModel.recentMessages){ message in
                        ConservationCell(viewModel: ConservationCellViewModel(message))
                    }
                }
            }
            
        }.onAppear{
            viewModel.fetchRecentMessages()
        }
    }
    
}


struct ConservationView_Previews: PreviewProvider {
    static var previews: some View {
        ConservationView()
    }
}
