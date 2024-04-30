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
    
    
    var body: some View {

        let wordView = LetterBoxRowFunctional(word: currWord, sucessfulWords: $sucessfulWords, repeatedWords: $repeatedWords, wrongWords: $wrongWords)
        ZStack {
            
            if gameOver {
                GameOverView(score: score)
            } else {
                NavigationStack{
                    ZStack{
                        Color.indigo2.ignoresSafeArea()
                        VStack{
                            wordView
                                .padding(.top, 0.2)
                            NavigationLink(destination: GameOverView(score: score ).navigationBarBackButtonHidden(true)
                                .ignoresSafeArea())
                            {
                                Text("Done!")
                                    .font(.custom("Lovely Madness", size: 30))
                            }.buttonStyle(GameOverButtonStyle())
                        }
                    }
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
    
    init(currWord: String) {
        self.currWord = currWord
    }
}



struct EPreviewContainer: View {
    
    @State var sucessfulWords: [String] = []
    @State var repeatedWords: Int = 0
    @State var wrongWords: Int = 0
    
    var body: some View {
        EndlessView(currWord: "Cake")
    }
    
    
    
}

struct EPreview: PreviewProvider {
    
    static var previews: some View {
        EPreviewContainer()
    }
}




