//
//  GameOverView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/29/24.
//

import SwiftUI

struct GameOverButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.indigo2)
            .frame(minHeight: 50, idealHeight: 150)
            .frame(minWidth: 150)
            .background(Color.platinum)
            .cornerRadius(8)

    }
}

struct GameOverView: View {
    
    var score: Int
    @State var returnHome = false
    
    init(score: Int) {
        self.score = score
            UITableView.appearance().backgroundColor = .green // Uses UIColor
        }
    
    
    var body: some View {
        ZStack {
            if returnHome {
                MainTabView()
            } else {
                NavigationStack {
                    ZStack {
                        Color.indigo2.ignoresSafeArea()
                        VStack {
                            Text("Game Over!")
                                .font(.custom("Lovely Madness", size: 40))
                                .foregroundStyle(Color.platinum)
                            Spacer()
                                .frame(height: 30)
                            Text("Score: \(score)")
                                .font(.custom("Lovely Madness", size: 30))
                                .foregroundStyle(Color.platinum)
                            Spacer()
                                .frame(height: 150)
                            NavigationLink(destination: MainTabView().navigationBarBackButtonHidden(true)
                                .ignoresSafeArea())
                            {
                                Text("Done!")
                                    .font(.custom("Lovely Madness", size: 30))
                            }.buttonStyle(GameOverButtonStyle())
                            
                        }.toolbar(.hidden, for: .navigationBar)
                    }
                }.toolbar(.hidden, for: .navigationBar)
            }
        }
        
    }
}

#Preview {
    GameOverView(score: 321)
}
