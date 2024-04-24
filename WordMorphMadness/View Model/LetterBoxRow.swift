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
    @State var letterBoxArray: [LetterBox]
    @State var selected: Int? = nil
    
    var body: some View {
        LazyHGrid(rows: row) {
            ForEach (0...word.count - 1, id: \.self) { num in
                letterBoxArray[num]
                    .frame(width: boxSize, height: boxSize)
                    .onTapGesture {
                        changeStatusToChanging(index: num, len: word.count, array: &letterBoxArray)
                        selected = num
                        print(selected)
                    }
            }
        }
        
    }
}

func getLetterBoxArray(word: String) -> [LetterBox] {
    var arr: [LetterBox] = []
    for char in word {
        arr += [LetterBox(letter: char, status: .notChanging)]
    }
    return arr
}

func changeStatusToChanging(index: Int, len: Int, array: inout [LetterBox]) {
    for idx in 0...len - 1 {
        if idx == index {
            array[idx].status = .changing
        } else {
            array[idx].status = .notChanging
        }
    }
}

struct LetterBoxRowPreview: PreviewProvider {
    static var previews: some View {
        LetterBoxRow(word: "love", letterBoxArray: getLetterBoxArray(word: "love"))
    }
}


