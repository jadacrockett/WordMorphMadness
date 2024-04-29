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
    
    var body: some View {

        let wordView = LetterBoxRowFunctional(word: currWord, sucessfulWords: $sucessfulWords, repeatedWords: $repeatedWords, wrongWords: $wrongWords)
        ZStack {
            Color.indigo2.ignoresSafeArea()
            wordView
                .padding(.top, 0.1)
                
        }
        .onChange(of: sucessfulWords.count) {
            switch difficulty {
            case .easy:
                score += 100
            case .medium:
                score += 80
            case .hard:
                score += 60
            }
        }
        .onChange(of: repeatedWords) {
            switch difficulty {
            case .easy:
                score += 0
            case .medium:
                score -= 10
            case .hard:
                score -= 25
            }
        }
        .onChange(of: wrongWords) {
            switch difficulty {
            case .easy:
                score -= 10
            case .medium:
                score -= 25
            case .hard:
                score -= 50
            }
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


