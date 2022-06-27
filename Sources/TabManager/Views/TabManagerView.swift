//
//  TabManagerView.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-25.
//

import Foundation
import SwiftUI

public struct TabManagerView<Identifier: Hashable, Content: View>: View {
    @ObservedObject var manager: TabManager<Identifier>
    @ViewBuilder var content: () -> Content
    
    public init(manager: TabManager<Identifier>, @ViewBuilder content: @escaping () -> Content) {
        self.manager = manager
        self.content = content
    }
    
    public var body: some View {
        TabView(selection: $manager.selection) {
            content()
        }
    }
}
