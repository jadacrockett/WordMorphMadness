//
//  ChallengeView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct ChalllengeView: View {
    var body: some View {
        ZStack {
            Color.platinum.ignoresSafeArea()
            Text("This is challenge view!")
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    ChalllengeView()
}

