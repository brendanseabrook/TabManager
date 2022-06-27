//
//  File.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-25.
//

import Foundation
import SwiftUI

public protocol Tabbable<Identifier> {
    associatedtype Identifier
    var id: Identifier { get }
    func onSelection()
    func onDeselection()
}

public class TestTabbable<Identifier, Inner: Tabbable<Identifier>>: Identifiable where Identifier: Hashable {
    let inner: Inner
    init(inner: Inner) {
        self.inner = inner
    }
}
