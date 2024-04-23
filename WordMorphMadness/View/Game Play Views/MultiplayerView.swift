//
//  MultiplayerView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct MultiplayerView: View {
    var body: some View {
        ZStack {
            Color.platinum.ignoresSafeArea()
            Text("This is multiplayer mode!")
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    MultiplayerView()
}
