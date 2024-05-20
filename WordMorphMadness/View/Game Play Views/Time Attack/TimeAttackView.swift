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
    var difficulty: Difficulty
    @State private var gameOver = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timeElapsed = 0
    private var timeLeft: Int {
        var returnValue = 0
        
        switch difficulty {
        case .easy:
            returnValue = 60 - timeElapsed
        case .medium:
            returnValue = 45 - timeElapsed
        case .hard:
            returnValue = 30 - timeElapsed
        }
        
        if returnValue >= 0 {
            return returnValue
        } else {
            return 0
        }
    }
    
    @State var settingsPresented: Bool = false
    @Binding var backToTAOptionView: Bool
    
    private var totalTime: DispatchTimeInterval {
        switch difficulty {
        case .easy:
            return DispatchTimeInterval.seconds(60)
        case .medium:
            return DispatchTimeInterval.seconds(45)
        case .hard:
            return DispatchTimeInterval.seconds(30)
        }
    }
    
    var body: some View {

        let wordView = LetterBoxRowFunctional(word: currWord, sucessfulWords: $sucessfulWords, repeatedWords: $repeatedWords, wrongWords: $wrongWords)
        NavigationStack {
            ZStack {
                
            
                    NavigationStack {
                        ZStack{
                            Color.indigo2.ignoresSafeArea()
                            VStack{
                                wordView
                                    .padding(.top, 0.2)
                                Button(action: {gameOver.toggle()} , label: {
                                    Text("Done!")
                                        .font(.custom("Lovely Madness", size: 30))
                                })
                                }.buttonStyle(GameOverButtonStyle())
                                .fullScreenCover(isPresented: $gameOver, content: {
                                    GameOverView(score: score, returnHome: $backToTAOptionView)
                                })
                        }
                    }
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
                ToolbarItemGroup(placement: .topBarLeading) {
                    Text("Score: \(score)")
                        .font(.system(size: 25))
                        .foregroundStyle(Color.platinum)
                }
                ToolbarItem(placement: .principal) {
                    Text("\(timeLeft)")
                        .font(.system(size: 25))
                        .foregroundStyle(Color.platinum)
                }
                
            }
            .onReceive(self.timer, perform: { time in
                timeElapsed += 1
            })
            .toolbar(.hidden, for: .tabBar)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + self.totalTime, execute: {gameOver = true})
            }
        }

    }

}
    




struct TAPreviewContainer: View {
    
    @State var sucessfulWords: [String] = []
    @State var repeatedWords: Int = 0
    @State var wrongWords: Int = 0
    @State var backToTAOptionView = false
    
    var body: some View {
        TimeAttackView(currWord: "Cake", difficulty: .hard, backToTAOptionView: $backToTAOptionView)
    }
    
    
    
}

struct TAPreview: PreviewProvider {
    
    static var previews: some View {
        TAPreviewContainer()
    }
}


