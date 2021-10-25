//
//  ConservationView.swift
//  Chatea
//
//  Created by Ece Ayvaz on 25.10.2021.
//

import SwiftUI

struct ConservationView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){

            ScrollView{
                //user cell
                HStack{
                    ForEach((0 ... 3), id:\.self){ _ in
                        UserCell()

                    }
                }
                //chats
                VStack(alignment: .leading){
                    HStack  {Spacer()}
                    ForEach((0 ... 10), id:\.self){ _ in
                        ConservationCell()
                            .padding(.horizontal)
 
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
