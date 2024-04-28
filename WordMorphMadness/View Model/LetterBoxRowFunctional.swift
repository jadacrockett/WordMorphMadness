//
//  LetterBoxRow.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct LetterBoxRowFunctional: View {
    
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
    private let staticletterBoxArray: [LetterBox]
    var gamePlayArray: [LetterBox] = []
    @State var letterBoxArray: [LetterBox]
    @State var selected = -1;
    @State private var userEntry: String = ""
    @FocusState private var keyboardFocused: Bool
    
    var body: some View {
        VStack {
            LazyHGrid(rows: row) {
                ForEach (0...word.count - 1, id: \.self) { num in
                    letterBoxArray[num]
                        .frame(width: boxSize, height: boxSize)
                        .onTapGesture {
                            changeStatusToChanging(index: num, len: word.count, array: &letterBoxArray)
                            selected = num
                            //print(selected)
                        }
                }
            }
            TextField("", text: $userEntry)
                .keyboardType(.alphabet)
                .autocorrectionDisabled(true)
                .tint(Color.clear)
                .foregroundStyle(Color.clear)
                .focused($keyboardFocused)
                .onChange(of: selected) {
                    resetArray(newArray: &letterBoxArray, oldArray: staticletterBoxArray)
                }
                .onChange(of: userEntry) {
                    //print(userEntry)
                    if (selected >= 0) && (!userEntry.isEmpty) {
                        letterBoxArray[selected].letter = String(userEntry.last!)
                    }
                }

            
        }.onAppear(perform: {keyboardFocused = true})
    }
    
    init(word: String) {
        self.word = word
        staticletterBoxArray = getLetterBoxArray(word: word)
        self.letterBoxArray = getLetterBoxArray(word: word)
    }
    
}

func getLetterBoxArray(word: String) -> [LetterBox] {
    var arr: [LetterBox] = []
    for char in word {
        arr += [LetterBox(letter: String(char), status: .notChanging)]
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

func resetArray(newArray: inout [LetterBox], oldArray: [LetterBox]) {
    for idx in 0..<newArray.count {
        newArray[idx].letter = oldArray[idx].letter
    }
}

struct LetterBoxRowFunctionalPreview: PreviewProvider {
    static var previews: some View {
        LetterBoxRowFunctional(word: "love")
    }
}


