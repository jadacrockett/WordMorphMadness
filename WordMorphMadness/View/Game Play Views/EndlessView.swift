//
//  EndlessView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct EndlessView: View {
    var body: some View {
        ZStack {
            Color.platinum.ignoresSafeArea()
            Text("This is endless mode!")
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    EndlessView()
}

