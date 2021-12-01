//
//  UserCellTests.swift
//  ChateaTests
//
//  Created by Ece Ayvaz on 24.11.2021.
//

import XCTest
import ViewInspector

extension ContentView: Inspectable { }
extension UserCell: Inspectable { }
@testable import Chatea

class UserCellTests: XCTestCase {


    func testUserCellViewWithEmailTextCorrect() throws {
        
        let subject = UserCell(user: User(email:"mocktest@gmail.com"))
        let text = try subject.inspect().vStack().text(1).string()
        XCTAssertEqual(text, "mocktest@gmail.com")
    }
}
