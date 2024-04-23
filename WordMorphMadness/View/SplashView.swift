//
//  SplashView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import Foundation
import SwiftUI
import AVKit

enum WordPhase: Int, CaseIterable {
    
    case cat, can, fan, fun
    
    var image: some View {
        var name: String
        switch self {
        case .cat: name = "CAT"
        case .can: name = "CAN"
        case .fan: name = "FAN"
        case .fun: name = "FUN"
        }
        return Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 250, height: 100)
    }
}

struct SplashView: View {
    
    @State private var isActive = false
    @State private var activeImageIndex = 0
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let images: [WordPhase] = [.cat, .can, .fan, .fun]
    
    var body: some View {
        
        ZStack {
            if self.isActive {
                //MainView()
            } else {
                Color.platinum.ignoresSafeArea()
                VStack {
                    Image("Word Morph Madness")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 350)
                    images[activeImageIndex].image
                        .onReceive(self.timer) { time in
                            if self.activeImageIndex == 3 {
                                self.activeImageIndex = 0
                            } else {
                                self.activeImageIndex += 1
                            }
                            
                        }
                }
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {withAnimation {self.isActive = true}}
            
        }
    }
}

#Preview {
    SplashView()
}
