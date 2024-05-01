//
//  ChallengeGameOver.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/30/24.
//

import SwiftUI

struct ChallengeGameOver: View {
    
    @State private var level: Int
    @State var returnHome = false
    @State var letterSwaps: Int
    
    init(level: Int, letterSwaps: Int ) {
        self.level = level
        self.letterSwaps = letterSwaps
    }
    
    var optimalSwaps: Int {
        challengeLevelDictionary[challengeLevelWordsByLevel[level]]?[1] as! Int
    }
    
    var success: String {
        if letterSwaps == optimalSwaps {
            return "Success"
        } else {
            return "Failed"
        }
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
                            Text("Level \(level)")
                                .font(.custom("Lovely Madness", size: 40))
                                .foregroundStyle(Color.platinum)
                            Spacer()
                                .frame(height: 30)
                            Text("Total Moves: \(letterSwaps)")
                                .font(.custom("Lovely Madness", size: 30))
                                .foregroundStyle(Color.platinum)
                            Spacer()
                                .frame(height: 30)
                            Text("Optimal Moves: \(optimalSwaps)")
                                .font(.custom("Lovely Madness", size: 30))
                                .foregroundStyle(Color.platinum)
                            Spacer()
                                .frame(height: 150)
                            Text("\(success)!")
                                .font(.custom("Lovely Madness", size: 30))
                                .foregroundStyle(Color.platinum)
                            Spacer()
                                .frame(height: 150)
                            NavigationLink(destination: GameChoiceView().navigationBarBackButtonHidden(true)
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
    ChallengeGameOver(level: 1, letterSwaps: 2)
}
