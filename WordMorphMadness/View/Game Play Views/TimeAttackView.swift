//
//  TimeAttackView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct TimeAttackView: View {
    var body: some View {
        ZStack {
            Color.platinum.ignoresSafeArea()
            Text("This is time attack view!")
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    TimeAttackView()
}
