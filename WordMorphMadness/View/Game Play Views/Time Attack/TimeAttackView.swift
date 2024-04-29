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
    @State var score: Int = 0
    @State var sucessfulWords: [String] = []
    @State var repeatedWords: Int = 0
    @State var wrongWords: Int = 0
    private var difficulty: TAOptionView.Difficulty
    
    private var time: Int {
        switch difficulty {
        case .easy:
            return 90
        case .medium:
            return 60
        case .hard:
            return 30
        }
    }
    
    var body: some View {

        let wordView = LetterBoxRowFunctional(word: currWord, sucessfulWords: $sucessfulWords, repeatedWords: $repeatedWords, wrongWords: $wrongWords)
        ZStack {
            Color.indigo2.ignoresSafeArea()
            wordView
                .padding(.top, 0.2)
                
        }
        .onChange(of: sucessfulWords.count) {
            score += 100
        }
        .onChange(of: repeatedWords) {
            score -= 25
        }
        .onChange(of: wrongWords) {
            score -= 50
        }
        .toolbar {
            ToolbarItem {
                Button("", systemImage: "gearshape.fill") {
                    
                }
                .backgroundStyle(Color.platinum)
            }
            ToolbarItemGroup(placement: .topBarLeading) {
                Text("Score: \(score)")
                    .font(.system(size: 25))
                    .foregroundStyle(Color.platinum)
            }
            
        }
        .toolbar(.hidden, for: .tabBar)
    }
    
    init(currWord: String, difficulty: TAOptionView.Difficulty) {
        self.currWord = currWord
        self.difficulty = difficulty
    }
}



struct TAPreviewContainer: View {
    
    @State var sucessfulWords: [String] = []
    @State var repeatedWords: Int = 0
    @State var wrongWords: Int = 0
    
    var body: some View {
        LetterBoxRowFunctional(word: "Cake", sucessfulWords: $sucessfulWords, repeatedWords: $repeatedWords, wrongWords: $wrongWords)
    }
    
    
    
}

struct TAPreview: PreviewProvider {
    
    static var previews: some View {
        TAPreviewContainer()
    }
}


