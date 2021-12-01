//
//  NewMessageServiceProtocol.swift
//  Chatea
//
//  Created by Ece Ayvaz on 30.11.2021.
//

import Foundation
import Firebase

protocol NewMessageServiceProtocol {
    typealias GetUsersCompletionHandler = ([User]) -> Void
    func fetchUser(_ completion: @escaping GetUsersCompletionHandler)

}

final class NewMessageService: NewMessageServiceProtocol {
    
    var users = [User]()
    func fetchUser(_ completion: @escaping GetUsersCompletionHandler) {
        Firestore.firestore().collection("users").getDocuments{ (snapshot,error) in
            guard let documents = snapshot?.documents else { return }

            self.users = documents.compactMap({try? $0.data(as: User.self)}).filter({$0.id != AuthViewModel.shared.userSession?.uid}) ?? []
            completion(self.users)

        }
    }
    
}
