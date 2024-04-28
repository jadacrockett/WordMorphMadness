//
//  TimeAttackView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI
import UIKit

struct TimeAttackView: View {
    
    @State var currWord: String
    
    var body: some View {

        
        ZStack {
            Color.indigo2.ignoresSafeArea()
            //Text("This is time attack view!")
            LetterBoxRowFunctional(word: currWord)
        }
        .toolbar(.hidden, for: .tabBar)
    }
}



#Preview {
    TimeAttackView(currWord: "Cake")
}

