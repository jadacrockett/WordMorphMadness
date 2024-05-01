//
//  Words.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/28/24.
//

import Foundation

func parseCSV(fileName: String) -> [String] {
    let fileURL = Bundle.main.url(forResource: fileName, withExtension: "csv")
    let words = try! String(contentsOf: fileURL!, encoding: .utf8)
    let separated = words.components(separatedBy: "\r")
    return separated
}

let threeLetterWords = parseCSV(fileName: "3LetterWords")
let fourLetterWords = parseCSV(fileName: "4LetterWords")
let fiveLetterWords = parseCSV(fileName: "5LetterWords")
let sixLetterWords = parseCSV(fileName: "6LetterWords")

func getRandomWord(length: Int) -> String {
    switch length {
    case 3:
        return threeLetterWords.randomElement()!
    case 4:
        return fourLetterWords.randomElement()!
    case 5:
        return fiveLetterWords.randomElement()!
    case 6:
        return sixLetterWords.randomElement()!
    default:
        return fourLetterWords.randomElement()!
    }
}

func checkWord(word: String) -> Bool {
    switch word.count {
    case 3:
        return threeLetterWords.contains(word)
    case 4:
        return fourLetterWords.contains(word)
    case 5:
        return fiveLetterWords.contains(word)
    case 6:
        return sixLetterWords.contains(word)
    default:
        return false
    }
}


let challengeLevelWordsByLevel = ["None", "cold"]
let challengeLevelDictionary = ["cold": ["wolf", 2]]
