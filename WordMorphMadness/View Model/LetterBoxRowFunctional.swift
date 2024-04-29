//
//  LetterBoxRow.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/23/24.
//

import SwiftUI

struct LetterBoxRowFunctional: View {
    
    @State var word: String
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
    @State private var staticletterBoxArray: [LetterBox]
    @State var gamePlayArray: [LetterBoxRow] = []
    @State var letterBoxArray: [LetterBox]
    @State var selected = -1;
    @State private var userEntry: String = ""
    @FocusState private var keyboardFocused: Bool
    @Binding var sucessfulWords: [String]
    @Binding var wrongWords: Int
    @Binding var repeatedWords: Int
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<gamePlayArray.count, id: \.self) { num in
                    gamePlayArray[num]
                }
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
                    .onSubmit {
                        let newWord = getWord(array: letterBoxArray).lowercased()
                        if checkWord(word: newWord) {
                            var statusArray = Array(repeating: 2, count: newWord.count)
                            statusArray[selected] = 3
                            let add = LetterBoxRow(word: newWord, wordStatusArray: statusArray)
                            gamePlayArray += [add]
                            letterBoxArray = getLetterBoxArray(word: newWord)
                            staticletterBoxArray = letterBoxArray
                            if !sucessfulWords.contains(newWord) {
                                sucessfulWords += [newWord]
                            } else {
                                repeatedWords += 1
                            }
                        } else {
                            var statusArray = Array(repeating: 2, count: newWord.count)
                            statusArray[selected] = 4
                            let add = LetterBoxRow(word: newWord, wordStatusArray: statusArray)
                            gamePlayArray += [add]
                            letterBoxArray = staticletterBoxArray
                            wrongWords += 1
                        }
                        keyboardFocused = true
                    }

                
            }.onAppear(perform: {keyboardFocused = true})
        }
    }
    
    init(word: String, sucessfulWords: Binding<[String]>, repeatedWords: Binding<Int>, wrongWords: Binding<Int>) {
        self.word = word
        staticletterBoxArray = getLetterBoxArray(word: word)
        self.letterBoxArray = getLetterBoxArray(word: word)
        self._sucessfulWords = sucessfulWords
        self._repeatedWords = repeatedWords
        self._wrongWords = wrongWords
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

func getWord(array: [LetterBox]) -> String {
    var word = ""
    for box in array {
        word += box.letter
    }
    return word
}






