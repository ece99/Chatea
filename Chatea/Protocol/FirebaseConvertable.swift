//
//  FirebaseConvertable.swift
//  Chatea
//
//  Created by Ece Ayvaz on 30.11.2021.
//

import Foundation

protocol FirebaseConvertable {
  func toDocument() -> [String: Any]
}
