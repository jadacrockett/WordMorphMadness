//
//  LetterBoxRow.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/24/24.
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
    @State var letterBoxArray: [LetterBox]
    
    var body: some View {
        LazyHGrid(rows: row) {
            ForEach (0...word.count - 1, id: \.self) { num in
                letterBoxArray[num]
                    .frame(width: boxSize, height: boxSize)
                    
            }
        }
        
    }
    
    init(word: String, wordStatusArray: [Int]) {
        self.word = word
        self.letterBoxArray = getLetterBoxArray(word: word, wordStatusArray: wordStatusArray)
    }
}

func getLetterBoxArray(word: String, wordStatusArray: [Int]) -> [LetterBox] {
    var arr: [LetterBox] = []
    let wordArray = Array(word)
    for i in 0..<word.count {
        switch wordStatusArray[i] {
        case 1:
            arr += [LetterBox(letter: wordArray[i] , status: .changing)]
        case 3:
            arr += [LetterBox(letter: wordArray[i] , status: .acceptable)]
        case 4:
            arr += [LetterBox(letter: wordArray[i] , status: .notAcceptable)]
        default:
            arr += [LetterBox(letter: wordArray[i] , status: .notChanging)]
        }
    }
    return arr
}


struct LetterBoxRowPreview: PreviewProvider {
    static var previews: some View {
        LetterBoxRow(word: "love",  wordStatusArray: [1, 2, 3, 4])
    }
}



