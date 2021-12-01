//
//  NewMessageViewTests.swift
//  ChateaTests
//
//  Created by Ece Ayvaz on 24.11.2021.
//

import XCTest
import ViewInspector
@testable import Chatea
import SwiftUI

extension NewMessageView : Inspectable { }

class NewMessageViewTests: XCTestCase {
    
    func testewMessageHaveUser() throws {
       /* let binding = Binding<Bool>(wrappedValue: false)
        let flag2 = Binding<User?>(wrappedValue: User(id: "1", email: "a.com", password: "1234", profileImageUrl: "www.deneme.com"))
        let viewModel = NewMessageViewModel()
        let userInsert = [User(id: "1", email: "a.com", password: "1234", profileImageUrl: "www.deneme.com")]
        
        
        var view = NewMessageView(showChatView: binding, user: flag2, viewModel: viewModel)
        
        let view = try sut.inspect().scrollView().vStack().forEach(flag2).button()*/
        /*let sut1 = try sut.inspect().scrollView().vStack()
         let exp = sut1.on(\.didAppear){view in
         XCTAssertFalse(try view.actualView().showChatView)
         try view.button(1).tap()
         XCTAssertTrue(try view.actualView().showChatView)*/
    }
    // ViewHosting.host(view: sut)
    // wait(for: [exp], timeout: 0.1)
}



