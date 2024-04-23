//
//  ClassicView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct ClassicView: View {
    var body: some View {
        ZStack {
            Color.platinum.ignoresSafeArea()
            Text("This is classic view!")
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    ClassicView()
}
