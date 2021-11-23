//
//  testUser.swift
//  ChateaTests
//
//  Created by Ece Ayvaz on 17.11.2021.
//

import XCTest
@testable import Chatea

class testUser: XCTestCase {

    func testMockUserNil() throws {
        let userModel: User? = User(id: nil, email: "ayvazzecee@gmail.com", password: "1234567", profileImageUrl: "www.pinterest.com")
        let user = try XCTUnwrap(userModel)
        XCTAssertNil(user.id)
    }
    func testMockUserTrue() throws {
        let userModel: User? = User(id:"1234", email: "ayvazzecee@gmail.com", password: "1234567", profileImageUrl: "www.pinterest.com")
        let user = try XCTUnwrap(userModel)
        let id = try XCTUnwrap(user.id)
        XCTAssertEqual(id,"1234")
    }
    
}
