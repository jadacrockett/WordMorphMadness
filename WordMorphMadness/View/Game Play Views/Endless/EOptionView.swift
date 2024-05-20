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
    @State private var showEndlessView = false
    @Binding var showEOptionView: Bool
    
    var body: some View {
        
        
        ZStack {
            Color.yellowGreenCrayola.ignoresSafeArea()
            
            ZStack {
                
                
                    VStack {
                        Picker("Word Length", selection: $selectedWordLength) {
                            Text("3").tag(3)
                            Text("4").tag(4)
                            Text("5").tag(5)
                            Text("6").tag(6)
                        }
                        Button(action: {
                            showEndlessView = true
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
                        .fullScreenCover(isPresented: $showEndlessView, content: {
                            NavigationStack {
                                EndlessView(currWord: getRandomWord(length: selectedWordLength), backToEOptionView: $showEOptionView)
                            }
                        })
                
            }
        }
    }
}

#Preview {
    @State var showEOptionView = true
    return EOptionView(showEOptionView: $showEOptionView)
    
}
