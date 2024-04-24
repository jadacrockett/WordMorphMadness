//
//  LetterBoxRow.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct LetterBoxRow: View {
    
    var word: String
    var row: [GridItem] {
        [GridItem(.fixed(CGFloat(word.count)))]
    }
    var boxSize: CGFloat {
        switch word.count {
        case 6:
            return 60
        default:
            return 75
        }
    }
    
    var body: some View {
        let wordArr = Array(word)
        LazyHGrid(rows: row) {
            ForEach (0...wordArr.count - 1, id: \.self) { num in
                LetterBox(letter: wordArr[num], status: .notChanging)
                    .frame(width: boxSize, height: boxSize)
            }
        }
        
    }
}

struct LetterBoxRowPreview: PreviewProvider {
    static var previews: some View {
        LetterBoxRow(word: "Cake")
    }
}


