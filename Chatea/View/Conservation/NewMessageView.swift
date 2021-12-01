//
//  NewMessageView.swift
//  Chatea
//
//  Created by Ece Ayvaz on 26.10.2021.
//

import SwiftUI
import Combine

final class Inspection<V>: InspectionEmissary {
    let notice = PassthroughSubject<UInt, Never>()
    var callbacks = [UInt: (V) -> Void]()
    
    func visit(_ view: V, _ line: UInt) {
        if let callback = callbacks.removeValue(forKey: line) {
            callback(view)
        }
    }
}
struct NewMessageView: View {
    @Binding var showChatView:Bool
    @Binding var user: User?
    @ObservedObject var viewModel = NewMessageViewModel()
    @Environment(\.presentationMode) var mode
    
    let publisher = PassthroughSubject<Bool, Never>()
    let inspection = Inspection<Self>()
    var didAppear: ((Self) -> Void)?
    
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    Button(action: {
                        showChatView.toggle()
                        self.user = user
                        mode.wrappedValue.dismiss()
                    }, label: {
                        UserCell(user: user)
                    })
                }
            }
        }.onReceive(publisher) { self.showChatView = $0 }
        .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
        .onAppear { self.didAppear?(self) }
        
        /* HStack{
         ForEach(viewModel.users){ user in
         //ForEach((0 ... 5), id:\.self){ _ in
         Button(action:{
         showChatView.toggle()
         self.user = user
         }, label: {
         UserCell(user: user)
         })
         
         
         }
         }*/
        
    }
}



