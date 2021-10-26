//
//  NewMessageView.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showChatView:Bool
    var body: some View {
        
        HStack{
            ForEach((0 ... 3), id:\.self){ _ in
                Button(action:{showChatView.toggle()
                }, label: {
                    UserCell()
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
