//
//  testUser.swift
//  ChateaTests
//
//  Created by Ece Ayvaz on 17.11.2021.
//

import XCTest
@testable import Chatea

class testUser: XCTestCase {

    
    func testMockUserTrue() throws {
        let userModel: User? = User(id:"1234", email: "ayvazzecee@gmail.com", password: "1234567", profileImageUrl: "www.pinterest.com")
        let user = try XCTUnwrap(userModel)
        let id = try XCTUnwrap(user.id)
        XCTAssertEqual(id,"1234")
    }
    
}
