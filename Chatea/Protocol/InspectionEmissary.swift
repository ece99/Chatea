//
//  InspectionEmissary.swift
//  Chatea
//
//  Created by Ece Ayvaz on 1.12.2021.
//

import Foundation
import Combine

public protocol InspectionEmissary: AnyObject {
    
    associatedtype V
    var notice: PassthroughSubject<UInt, Never> { get }
    var callbacks: [UInt: (V) -> Void] { get set }
}


