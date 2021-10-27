//
//  UserCell.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    var body: some View {
        
        VStack{
           //Image("foto")
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:55)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Text(user.email)
                .font(.system(size: 12))

        }
    }
}

