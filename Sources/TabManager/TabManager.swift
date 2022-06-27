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
                models.first(where: { $0.id.hashValue == selection?.hashValue })?.onDeselection()
            }
        }
    }
    
    public var models: [any Tabbable]
    
    public init(selection: Identifier? = nil, models: [any Tabbable]) {
        self.selection = selection
        self.models = models
    }
    
    func moveToTab(identifiedBy: Identifier) {
        if identifiedBy != selection {
            models.first(where: { $0.id.hashValue == identifiedBy.hashValue })?.onSelection()
            selection = identifiedBy
        }
    }
}
