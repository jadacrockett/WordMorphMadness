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
    var highScore: Int
    @Binding var returnHome: Bool
    
    var body: some View {
        ZStack {
                NavigationStack {
                    ZStack {
                        Color.indigo2.ignoresSafeArea()
                        VStack {
                            Text("Game Over!")
                                .font(.custom("Lovely Madness", size: 40))
                                .foregroundStyle(Color.platinum)
                            Spacer()
                                .frame(height: 30)
                            Text("High Score: \(highScore)")
                                .font(.custom("Lovely Madness", size: 30))
                                .foregroundStyle(Color.platinum)
                            Spacer()
                                .frame(height: 30)
                            Text("Score: \(score)")
                                .font(.custom("Lovely Madness", size: 30))
                                .foregroundStyle(Color.platinum)
                            Spacer()
                                .frame(height: 150)
                            Button(action: {
                                returnHome.toggle()
                            }, label: {
                                Text("Done!")
                                    .font(.custom("Lovely Madness", size: 30))
                            }).buttonStyle(GameOverButtonStyle())
                            
                        }
                    }
                }.toolbar(.hidden, for: .navigationBar)
        }.toolbar(.hidden, for: .navigationBar)
        
    }
}

#Preview {
    @State var returnHome = false
    @State var returnHome2 = false
    
    return GameOverView(score: 321, highScore: 450,returnHome: $returnHome)

}
