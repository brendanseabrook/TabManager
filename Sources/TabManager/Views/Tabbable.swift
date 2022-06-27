//
//  File.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-25.
//

import Foundation
import SwiftUI

public protocol Tabbable: Identifiable {
    associatedtype Id
    var id: Id { get }
    func onSelection()
    func onDeselection()
}
