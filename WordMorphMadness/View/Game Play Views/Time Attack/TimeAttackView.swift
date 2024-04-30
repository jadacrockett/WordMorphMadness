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
    @State private var gameOver = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timeElapsed = 0
    private var timeLeft: Int {
        switch difficulty {
        case .easy:
            return 60 - timeElapsed
        case .medium:
            return 45 - timeElapsed
        case .hard:
            return 30 - timeElapsed
        }
    }
    
    @State var settingsPresented: Bool = false
    
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
        ZStack {
            
            if gameOver {
                GameOverView(score: score)
            } else {
                Color.indigo2.ignoresSafeArea()
                wordView
                    .padding(.top, 0.2)
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
            ToolbarItem {
                Button("", systemImage: "gearshape.fill") {
                    settingsPresented.toggle()
                }
                .backgroundStyle(Color.platinum)
                .sheet(isPresented: $settingsPresented, content: {
                    NavigationStack {
                        ZStack {
                            Color.indigo2.ignoresSafeArea()
                            NavigationLink("Exit") {
                                MainTabView().navigationBarBackButtonHidden(true)
                                    .ignoresSafeArea()
                            }.buttonStyle(GameOverButtonStyle())
                        }
                    }
                })
                
            }
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


