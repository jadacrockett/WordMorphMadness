//
//  ChallengeView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct ChallengeView: View {
    
    var level: Int
    @State var sucessfulWords: [String] = []
    @State var repeatedWords: Int = 0
    @State var wrongWords: Int = 0
    var totalWords: Int {
        sucessfulWords.count + repeatedWords + wrongWords
    }
    @State var gameOver = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if !gameOver {
                    Color.indigo2.ignoresSafeArea()
                    VStack {
                        LetterBoxRowFunctional(word: challengeLevelWordsByLevel[level], sucessfulWords: $sucessfulWords, repeatedWords: $repeatedWords, wrongWords: $wrongWords)
                        NavigationLink(destination: ChallengeGameOver(level: level, letterSwaps: totalWords)) {
                            Text("Give Up!")
                                .font(.custom("Lovely Madness", size: 30))
                        }.buttonStyle(GameOverButtonStyle())
                    }.onChange(of: sucessfulWords) {
                        print(sucessfulWords.last!)
                        print(challengeLevelDictionary[challengeLevelWordsByLevel[level]]?[0] as! String)
                        if sucessfulWords.last! == (challengeLevelDictionary[challengeLevelWordsByLevel[level]]?[0] as! String) {
                            gameOver = true
                        }
                    }
                } else {
                    ChallengeGameOver(level: level, letterSwaps: totalWords)
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}


#Preview {
    ChallengeView(level: 1)
}
