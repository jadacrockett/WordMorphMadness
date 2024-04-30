//
//  MainTabView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selection = 2
    @State var coins = 0
    
    var body: some View {
        
        NavigationStack {
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
            .toolbar {
                ToolbarItem {
                    Button("", systemImage: "gearshape.fill") {
                        
                    }
                }
                ToolbarItem(placement: .principal) {
                    Image(systemName: "person.circle")
                }
                
                ToolbarItemGroup(placement: .topBarLeading) {
                    Image(systemName: "dollarsign")
                    Text(String(coins))
                        .font(.system(size: 25))
                }
            }.foregroundColor(.rubyRed)
        }
    }
}

#Preview {
    MainTabView()
}
