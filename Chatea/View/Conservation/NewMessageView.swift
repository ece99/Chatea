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
    var body: some View {
        
            HStack{
                ForEach(viewModel.users){ user in
                //ForEach((0 ... 5), id:\.self){ _ in
                    Button(action:{showChatView.toggle()
                    }, label: {
                        UserCell(user: user)
                    })
                    

                }
            }
    }
    }


struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(showChatView: .constant(true))
    }
}
