//
//  EOptionView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/29/24.
//

import SwiftUI
import UIKit

struct EOptionView: View {
    
    @State private var selectedWordLength = 3
    @State private var currWord: String = "Cake"
    @State private var showTAView = false
    
    var body: some View {
        
        
        ZStack {
            Color.yellowGreenCrayola.ignoresSafeArea()
            
            ZStack {
                
                if !showTAView {
                    VStack {
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
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                NavigationLink("< Back") {
                                    GameChoiceView()
                                        .navigationBarBackButtonHidden()
                                }
                            }
                        }
                    
                } else {
                    EndlessView(currWord: getRandomWord(length: selectedWordLength))
                }
            }
        }
    }
}
