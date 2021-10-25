//
//  UserCell.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        
        VStack{
            Image("foto")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:55)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Text("Ece Ayvaz")
                .font(.system(size: 12))

        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
