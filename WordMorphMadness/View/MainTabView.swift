//
//  MainTabView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var selection = 2
    
    var body: some View {
        
        TabView(selection: $selection) {
            StoreView()
                .tabItem { Label("Store", systemImage: "storefront.fill") }
                .tag(1)
            GamePlayView()
                .tabItem { Label("Play", systemImage: "arrowtriangle.right.circle.fill")}
                .tag(2)
            ResultsView()
                .tabItem { Label("Results", systemImage: "clipboard")}
                .tag(3)
        }
    }
}

#Preview {
    MainView()
}
