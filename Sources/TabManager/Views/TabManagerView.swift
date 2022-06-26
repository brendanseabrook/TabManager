//
//  TabManagerView.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-25.
//

import Foundation
import SwiftUI

struct TabManagerView<TabTypes, Content>: View where Content : View, TabTypes: Tabbable {
    
    @ObservedObject var manager: TabManager<TabTypes>
    @ViewBuilder var content: () -> Content
    
    public init(manager: TabManager<TabTypes>, @ViewBuilder content: @escaping () -> Content) {
        self.manager = manager
        self.content = content
    }
    
    var body: some View {
        TabView(selection: $manager.selection) {
            content()
        }
    }
}
