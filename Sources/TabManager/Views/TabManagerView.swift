//
//  TabManagerView.swift
//  
//
//  Created by Brendan Seabrook on 2022-06-25.
//

import Foundation
import SwiftUI

struct TabManagerView<TabTypes: Tabbable, Content: View>: View {
    @ObservedObject var manager: TabManager<TabTypes>
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        TabView(selection: $manager.selection) {
            content()
        }
    }
}
