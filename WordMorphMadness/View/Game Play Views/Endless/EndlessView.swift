//
//  EndlessView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//


import SwiftUI
import UIKit

struct EndlessView: View {
    
    @State var currWord: String
    @State var score: Int = 0
    @State var sucessfulWords: [String] = []
    @State var repeatedWords: Int = 0
    @State var wrongWords: Int = 0
    @State private var gameOver = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timeElapsed = 0
    
    @State var settingsPresented: Bool = false
    @Binding var backToEOptionView: Bool
    
    
    var body: some View {

        let wordView = LetterBoxRowFunctional(word: currWord, sucessfulWords: $sucessfulWords, repeatedWords: $repeatedWords, wrongWords: $wrongWords)
        ZStack {

                NavigationStack{
                    ZStack{
                        Color.indigo2.ignoresSafeArea()
                        VStack{
                            wordView
                                .padding(.top, 0.2)
                            Button(action: {gameOver.toggle()}, label: {
                                Text("Done!")
                                    .font(.custom("Lovely Madness", size: 30))
                            }).buttonStyle(GameOverButtonStyle())
                                .fullScreenCover(isPresented: $gameOver, content: {
                                    GameOverView(score: score, returnHome: $backToEOptionView)
                                })
                        }
                    }.onChange(of: sucessfulWords.count) {
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
                            Text("\(timeElapsed)")
                                .font(.system(size: 25))
                                .foregroundStyle(Color.platinum)
                        }
                        
                    }
                    .onReceive(self.timer, perform: { time in
                        timeElapsed += 1
                    })
                    .toolbar(.hidden, for: .tabBar)
                }
        }
        
    }

}



struct EPreviewContainer: View {
    
    @State var sucessfulWords: [String] = []
    @State var repeatedWords: Int = 0
    @State var wrongWords: Int = 0
    @State var backToEOptionView = false
    
    var body: some View {
        EndlessView(currWord: "Cake", backToEOptionView: $backToEOptionView)
    }
    
    
    
}

struct EPreview: PreviewProvider {
    
    static var previews: some View {
        EPreviewContainer()
    }
}




