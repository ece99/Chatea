//
//  NewMessageView.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showChatView:Bool
    @ObservedObject var viewModel = NewMessageViewModel()
    @Binding var user: User?
    var body: some View {
        
            HStack{
                ForEach(viewModel.users){ user in
                //ForEach((0 ... 5), id:\.self){ _ in
                    Button(action:{
                        showChatView.toggle()
                        self.user = user
                    }, label: {
                        UserCell(user: user)
                    })
                    

                }
            }
    }
    }



