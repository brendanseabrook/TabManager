//
//  File.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-25.
//

import Foundation
import SwiftUI

@available(macOS 10.15, *)
protocol Tabbable<Id, T> where Id: Hashable {
    associatedtype T
    associatedtype Id
    var id: Id { get }
    var onSelection:((_ value: T?) -> Void)? { get }
    var onDeselection:() -> Void { get }
}
