//
//  TabManager.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-26.
//

import Foundation

public class TabManager<Identifier: Hashable>: ObservableObject {
    @Published public var selection: Identifier? = nil {
        willSet {
            if newValue != selection {
                models.first(where: { $0.id.hashValue == selection?.hashValue })?.inner.onDeselection()
            }
        }
    }
    
    public var models: [AnyTabbable<Identifier>]
    
    public init(selection: Identifier? = nil, models: [AnyTabbable<Identifier>]) {
        self.selection = selection
        self.models = models
    }
    
    func moveToTab(identifiedBy: Identifier) {
        if identifiedBy != selection {
            models.first(where: { $0.id.hashValue == identifiedBy.hashValue })?.inner.onSelection()
            selection = identifiedBy
        }
    }
}
