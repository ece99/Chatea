//
//  AuthViewModelTest.swift
//  ChateaTests
//
//  Created by Ece Ayvaz on 17.11.2021.
//

import XCTest
@testable import Chatea

class AuthViewModelTest: XCTestCase {

    var viewModel: AuthViewModel!
    var mockAuthService: MockAuthService!
    
    override func setUp() {
        
        mockAuthService = MockAuthService()
        viewModel = .init(authService: mockAuthService!)
    }

}
