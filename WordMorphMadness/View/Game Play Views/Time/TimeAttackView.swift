//
//  TimeAttackView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI
import UIKit

struct TimeAttackView: View {
    
    @State var currWord: String
    @State private var userEntry: String = " "
    @FocusState private var keyboardFocused: Bool
    @State private var currRow: LetterBoxRowFunctional = LetterBoxRowFunctional(word: "")
    
    var body: some View {
        
        var gamePlay: [LetterBox] = []
        
        ZStack {
            Color.indigo2.ignoresSafeArea()
            //Text("This is time attack view!")
            ScrollView {
                ForEach(0..<gamePlay.count, id: \.self) { num in
                    gamePlay[num]
                }
                let currRow = LetterBoxRowFunctional(word: currWord)
                currRow
                    
            }
        }
        .onAppear {
            keyboardFocused = true
        }
        .toolbar(.hidden, for: .tabBar)
    }
}



#Preview {
    TimeAttackView(currWord: "Cake")
}
