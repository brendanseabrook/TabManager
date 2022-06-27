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

public class AnyTabbable<Identifier, Wrapped: Tabbable<Identifier>>: Identifiable where Identifier: Hashable {
    public let inner: Wrapped
    init(inner: Wrapped) {
        self.inner = inner
    }
}
