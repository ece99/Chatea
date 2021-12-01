//
//  NewMessageViewModelTest.swift
//  ChateaTests
//
//  Created by Ece Ayvaz on 30.11.2021.
//

import XCTest
import Combine
@testable import Chatea

class NewMessageViewModelTest: XCTestCase {
    
    var viewModel: NewMessageViewModel!
    var mockNewMessageService: MockNewMessageService!
    var cancellables = Set<AnyCancellable>()
    
    override func setUp(){
        
        mockNewMessageService = MockNewMessageService(testUser: [User(id:"1234567890",email: "ege@gmail.com", password: "123456789",profileImageUrl: "www.pinterest.com")])
        viewModel = .init(newMessageService: mockNewMessageService)
    }
    
    
    func testNewMessageViewModelSendShouldReturnItems() {
        
        let expectation  = XCTestExpectation(description: "Should return items after 3 seconds.")
        
        viewModel.$users
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        viewModel.send()
        
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(viewModel.users.count, 0)
    }
    
    func testMockNewMessageViewModelDoesSetValuesCorrectly(){
        
        let testUser: [User]? = nil
        let newMessageService = MockNewMessageService(testUser: testUser)
        XCTAssertFalse(newMessageService.testUser.isEmpty)
    }
    
    func testMockNewMessageViewModelDoesReturnValues(){
        let newMessageService = MockNewMessageService(testUser: nil)
        var testUser : [User] = []
        let expectation = XCTestExpectation()
        newMessageService.fetchUser{ returnedItems in
            testUser = returnedItems
            expectation.fulfill()
            
        }
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(testUser.count, newMessageService.testUser.count)
            
        }
    }
    
    

