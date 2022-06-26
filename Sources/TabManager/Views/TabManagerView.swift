//
//  TabManagerView.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-25.
//

import Foundation
import SwiftUI

public struct TabManagerView<TabTypes: Tabbable, Content: View>: View {
    @ObservedObject var manager: TabManager<TabTypes>
    @ViewBuilder var content: () -> Content
    
    public init(manager: TabManager<TabTypes>, @ViewBuilder content: @escaping () -> Content) {
        self.manager = manager
        self.content = content
    }
    
    public var body: some View {
        TabView(selection: $manager.selection) {
            content()
        }
    }
}
