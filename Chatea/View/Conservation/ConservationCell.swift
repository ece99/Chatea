//
//  ConservationCell.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import SwiftUI

struct ConservationCell: View {
    var body: some View {
        
        VStack{
            HStack{
                Image("foto")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading){
                    Text("Ece Ayvaz")
                        .font(.system(size: 14, weight:.semibold))
                    
                    Text("Some text messages")
                        .font(.system(size:15))
                }.foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
            Divider()
        }
    }
}

struct ConservationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConservationCell()
    }
}
