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

    
    @State private var selectedDifficulty: Difficulty = .easy
    @State private var selectedWordLength = 3
    @State private var currWord: String = "Cake"
    @Binding var showTAOptionView: Bool
    @State private var showTAView = false
    
    var body: some View {
        
        
        NavigationStack {
            ZStack {
                Color.yellowGreenCrayola.ignoresSafeArea()
                
                ZStack {
                    
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
                                showTAView = true
                            }, label: {
                                Text("Submit")
                                    .bold()
                            }).padding(20).buttonStyle(SubmitButtonStyle())
                            
                        }.pickerStyle(.segmented)
                            .toolbar {
                                ToolbarItem(placement: .topBarLeading) {
                                    NavigationLink("< Back") {
                                        GameChoiceView()
                                            .navigationBarBackButtonHidden()
                                    }
                                }
                            }
                            .fullScreenCover(isPresented: $showTAView, content: {
                                NavigationStack {
                                    TimeAttackView(currWord: getRandomWord(length: selectedWordLength), difficulty: selectedDifficulty, backToTAOptionView: $showTAOptionView)
                                }
                            })
                }
            }
        }
    }
}

enum Difficulty: String, CaseIterable, Identifiable {
    case easy, medium, hard
    var id: Self { self }
}
struct TAOptionPreviewContainer: View {
    
    @State var showTAView = false
    
    var body: some View {
        TAOptionView(showTAOptionView: $showTAView)
    }
    
    
    
}

struct TAOptionPreview: PreviewProvider {
    
    static var previews: some View {
        TAOptionPreviewContainer()
    }
}
