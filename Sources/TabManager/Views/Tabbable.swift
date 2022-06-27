//
//  File.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-25.
//

import Foundation
import SwiftUI

@available(macOS 10.15, *)
public protocol Tabbable<Id> where Id: Hashable {
    associatedtype Id
    var id: Id { get }
    func onSelection()
    func onDeselection()
}
