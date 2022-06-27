//
//  TabManager.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-26.
//

import Foundation

public class TabManager<Identifier: Hashable, Inner: Tabbable<Identifier>>: ObservableObject {
    @Published public var selection: Identifier? = nil {
        willSet {
            if newValue != selection {
                models.first(where: { $0.inner.id == selection })?.inner.onDeselection()
            }
        }
    }
    
    public var models: [TestTabbable<Identifier, Inner>]
    
    public init(selection: Identifier? = nil, models: [TestTabbable<Identifier, Inner>]) {
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
