//
//  TabManager.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-26.
//

import Foundation

public class TabManager<TabbableModel: Tabbable>: ObservableObject {
    @Published var selection: TabbableModel.Id? = nil {
        willSet {
            if newValue != selection {
                models.first(where: { $0.id == selection })?.onDeselection?()
            }
        }
    }
    
    public var models: [TabbableModel]
    
    public init(selection: TabbableModel.Id? = nil, models: [TabbableModel]) {
        self.selection = selection
        self.models = models
    }
    
    func moveToTab(identifiedBy: TabbableModel.Id) {
        if identifiedBy != selection {
            models.first(where: { $0.id == identifiedBy })?.onSelection?()
            selection = identifiedBy
        }
    }
}
