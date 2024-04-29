//
//  OptionView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/28/24.
//

import SwiftUI
import UIKit

struct SubmitButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.platinum)
            .frame(height: 50)
            .frame(minWidth: 100)
            .background(Color.metallicSeaweed)
            .cornerRadius(8)

    }
}

struct TAOptionView: View {
    
    enum Difficulty: String, CaseIterable, Identifiable {
        case easy, medium, hard
        var id: Self { self }
    }
    
    @State private var selectedDifficulty: Difficulty = .easy
    @State private var selectedWordLength = 3
    @State private var currWord: String = "Cake"
    @State private var showTAView = false
    
    var body: some View {
        
        
        ZStack {
            Color.yellowGreenCrayola.ignoresSafeArea()
            
            ZStack {
                
                if !showTAView {
                    VStack {
                        Picker("Difficulty", selection: $selectedDifficulty) {
                            ForEach(Difficulty.allCases) { difficulty in
                                Text(difficulty.rawValue.capitalized)
                            }
                        }
                        Picker("Word Length", selection: $selectedWordLength) {
                            Text("3").tag(3)
                            Text("4").tag(4)
                            Text("5").tag(5)
                            Text("6").tag(6)
                        }
                        Button(action: {
                            currWord = getRandomWord(length: selectedWordLength)
                            showTAView = true
                        }, label: {
                            Text("Submit")
                                .bold()
                        }).padding(20).buttonStyle(SubmitButtonStyle())
                        
                    }.pickerStyle(.segmented)
                    
                } else {
                    TimeAttackView(currWord: currWord, difficulty: selectedDifficulty)
                }
            }
        }
    }
}

enum Difficulty: String, CaseIterable, Identifiable {
    case easy, medium, hard
    var id: Self { self }
}


#Preview {
    TAOptionView()
}
