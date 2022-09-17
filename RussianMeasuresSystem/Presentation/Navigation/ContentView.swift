//
//  ContentView.swift
//  Glagolitsa
//
//  Created by Дмитрiй Канунниковъ on 10.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: SidebarItem? = SidebarItem.main
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationSplitView {
            Sidebar(selection: $selection)
        } detail: {
            NavigationStack(path: $path) {
                DetailColumn(selection: $selection)
            }
        }
        .onChange(of: selection) { _ in
            path.removeLast(path.count)
        }
#if os(macOS)
        .frame(minWidth: 600, minHeight: 450)
#endif
#if !os(tvOS)
        .onAppear {
            Util.requestReviewIfNeeded()
        }
#endif
    }
}

struct ContentView_Previews: PreviewProvider {
    
    struct Preview: View {
        
        var body: some View {
            ContentView()
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
