//
//  ConservationCell.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import SwiftUI
import Kingfisher

struct ConservationCell: View {
    //let viewModel: MessageViewModel
    @ObservedObject var viewModel : ConservationCellViewModel
    var body: some View {
        if let user = viewModel.message.user {
            NavigationLink(
                destination: ChatView(user: user),
                label: {
                    VStack{
                        HStack{
                            KFImage(viewModel.chatPartnerProfileImageUrl)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading){
                                if let user = viewModel.message.user{
                                    Text(user.email)
                                        .font(.system(size: 14, weight:.semibold))
                                }
                                
                                Text(viewModel.message.text)
                                    .font(.system(size:15))
                            }.foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal)
                        Divider()
                    }
                })
        }
        /*.onAppear{
         viewModel.fetchUser()
         }*/
    }
}
