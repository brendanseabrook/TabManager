//
//  TabManager.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-26.
//

import Foundation

public class TabManager<TabbableModel>: ObservableObject where TabbableModel: Tabbable {
    @Published var selection: TabbableModel.Id? {
        willSet {
            if newValue != selection {
                models.first(where: { $0.id == selection })?.onDeselection()
            }
        }
    }
    var models: [TabbableModel]
    
    public init(selection: TabbableModel.Id? = nil, models: [TabbableModel]) {
        self.selection = selection
        self.models = models
    }
    
    func moveToTab(identifiedBy: TabbableModel.Id, selectionPayload: TabbableModel.T? = nil) {
        if identifiedBy != selection {
            models.first(where: { $0.id == identifiedBy })?.onSelection?(selectionPayload)
            selection = identifiedBy
        }
    }
    
    func registerTabModel(model: TabbableModel) {
        models.append(model)
    }
}