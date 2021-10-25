//
//  MainView.swift
//  Chatea
//
//  Created by Ece Ayvaz on 21.10.2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            TabView{
                ConservationView()
                    .tabItem { Image(systemName: "bubble.left") }
            }
            .navigationTitle("Chats")
            .navigationBarItems(trailing:
                            Button(action: {
                                print("Log out button pressed...")
                            }) {
                                Text("Log Out")
                            }
                        )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
