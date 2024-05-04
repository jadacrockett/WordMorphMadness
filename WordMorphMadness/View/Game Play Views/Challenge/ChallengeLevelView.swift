//
//  ChallengeLevelView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/30/24.
//

import SwiftUI

struct LevelButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.platinum)
            .frame(height: 55)
            .frame(width: 55)
            .background(Color.indigo2)
            .cornerRadius(8)
            .multilineTextAlignment(.center)
            .font(.system(size: 20))

    }
}

struct ChallengeLevelView: View {
    
    let levels = 50
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.yellowGreenCrayola.ignoresSafeArea()
                Grid {
                    GridRow{
                        ForEach(1..<7) {num in
                            NavigationLink("Level \(num)") {
                                ChallengeView(level: num)
                                    .navigationBarBackButtonHidden()
                            }
                            .buttonStyle(LevelButtonStyle())
                        }
                    }
                    GridRow{
                        ForEach(7..<13) {num in
                            NavigationLink("Level \(num)") {
                                ChallengeView(level: num)
                                    .navigationBarBackButtonHidden()
                            }
                            .buttonStyle(LevelButtonStyle())
                        }
                    }
                    GridRow{
                        ForEach(13..<19) {num in
                            NavigationLink("Level \(num)") {
                                ChallengeView(level: num)
                                    .navigationBarBackButtonHidden()
                            }
                            .buttonStyle(LevelButtonStyle())
                        }
                    }
                    GridRow{
                        ForEach(19..<25) {num in
                            NavigationLink("Level \(num)") {
                                ChallengeView(level: num)
                                    .navigationBarBackButtonHidden()
                            }
                            .buttonStyle(LevelButtonStyle())
                        }
                    }
                    GridRow{
                        ForEach(25..<31) {num in
                            NavigationLink("Level \(num)") {
                                ChallengeView(level: num)
                                    .navigationBarBackButtonHidden()
                            }
                            .buttonStyle(LevelButtonStyle())
                        }
                    }
                    GridRow{
                        ForEach(31..<37) {num in
                            NavigationLink("Level \(num)") {
                                ChallengeView(level: num)
                                    .navigationBarBackButtonHidden()
                            }
                            .buttonStyle(LevelButtonStyle())
                        }
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink("< Back") {
                        GameChoiceView()
                            .navigationBarBackButtonHidden()
                    }
                }
            }
        }
    }
}

#Preview {
    ChallengeLevelView()
}
