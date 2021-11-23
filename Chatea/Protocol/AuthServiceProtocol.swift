//
//  AuthServiceProtocol.swift
//  Chatea
//
//  Created by Ece Ayvaz on 18.11.2021.
//

import Foundation

protocol AuthServiceProtocol {
    
    var didAuthenticationUser : Bool {get set}
//    var userSession : Any {get}
//    var tempCurrentUser: Any {get}
    
    func login(withEmail email: String , password: String, completion: @escaping (Result <Bool, Error>)->Void)
    func register(withEmail email: String, password: String)
    func logout()
    func fetchUser()
    func uploadImage()
}
