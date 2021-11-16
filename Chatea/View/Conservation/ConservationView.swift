//
//  ConservationView.swift
//  Chatea
//
//  Created by Ece Ayvaz on 25.10.2021.
//

import SwiftUI

struct ConservationView: View {
    @State private var showNewMessageView = false
    @State private  var showChatView = false
    @State var selectedUser: User?
    @ObservedObject var viewModel =  ConservationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let user = selectedUser {
                NavigationLink(
                    destination: ChatView(user: user),
                    isActive: $showChatView,
                    label: {
                    })
            }
            
            //NewMessageView(showChatView: $showChatView, user: $selectedUser)
            
            ScrollView{
                
                VStack(alignment: .leading){
                    HStack  {Spacer()}
                    ForEach(viewModel.recentMessages){ message in
                        ConservationCell(viewModel: ConservationCellViewModel(message))
                    }
                }
            }
            VStack{
                Button(action: {
                    showNewMessageView.toggle()
                }, label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .padding()
                })
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .sheet(isPresented: $showNewMessageView, content: {
                    NewMessageView(showChatView: $showChatView, user: $selectedUser)
                })
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
