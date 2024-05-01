//
//  GameChoiceView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.platinum)
            .frame(minHeight: 40, idealHeight: 60)
            .frame(minWidth: 250)
            .background(Color.rubyRed)
            .cornerRadius(8)

    }
}

struct GamePlayView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.platinum.ignoresSafeArea()
                VStack {
                    Image("Word Morph Madness")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                    Spacer()
                        .frame(height: 0)
                    NavigationLink("Classic Mode") {
                        ClassicView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(MyButtonStyle())
                    NavigationLink("Time Attack Mode") {
                        TAOptionView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(MyButtonStyle())
                    NavigationLink("Challenge Mode") {
                        ChalllengeView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(MyButtonStyle())
                    NavigationLink("Endless Mode") {
                        EOptionView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(MyButtonStyle())
                    NavigationLink("Multiplayer Mode") {
                        MultiplayerView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(MyButtonStyle())
                    Spacer()
                        .frame(height: 50)
                }
            }
            .font(.system(size: 25))
        }//.toolbar(.hidden, for: .navigationBar)

    }
}

#Preview {
    GamePlayView()
}
