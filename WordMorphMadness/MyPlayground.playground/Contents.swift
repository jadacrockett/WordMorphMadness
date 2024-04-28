import Foundation

func parseCSV(fileName: String) -> [String] {
    let fileURL = Bundle.main.url(forResource: fileName, withExtension: "csv")
    let words = try! String(contentsOf: fileURL!, encoding: .utf8)
    let separated = words.components(separatedBy: "\r")
    return separated
}

let threeLetterWords = parseCSV(fileName: "3LetterWords")
let fourLetterWords = parseCSV(fileName: "4LetterWords")

func getRandomWord(length: Int) -> String {
    switch length {
    case 3:
        return threeLetterWords.randomElement()!
    case 4:
        return fourLetterWords.randomElement()!
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
    default:
        return false
    }
}


checkWord(word: "song")
