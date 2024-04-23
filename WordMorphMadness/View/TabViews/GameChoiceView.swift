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
            .frame(height: 60)
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
                    NavigationLink("Classic Mode") {
                        ClassicView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(MyButtonStyle())
                    NavigationLink("Time Attack Mode") {
                        TimeAttackView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(MyButtonStyle())
                    NavigationLink("Challenge Mode") {
                        ChalllengeView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(MyButtonStyle())
                    NavigationLink("Endless Mode") {
                        EndlessView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(MyButtonStyle())
                    NavigationLink("Multiplayer Mode") {
                        MultiplayerView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(MyButtonStyle())
                }
            }
            .font(.system(size: 25))
        }

    }
}

#Preview {
    GamePlayView()
}
