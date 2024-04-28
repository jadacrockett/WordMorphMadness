//
//  getAPICalls.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/28/24.
//

import Foundation

func getRandomWordFromAPI(length: Int) throws -> String {
    guard let url = URL(string: "https://script.google.com/macros/s/AKfycbzALYvS8HL5SXBc8mie5Ivj06l8zRbf7AsW4B1X5r5mil9l0QfmIHqnkaN9oG2sHnUG/exec?length=\(length)") else {
        throw URLError(.badURL)
    }
    let data = try Data(contentsOf: url)
    guard let word = String(data: data, encoding: .utf8) else {
        throw NSError(domain: "com.example", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response as UTF-8 string"])
    }
    return word.trimmingCharacters(in: .whitespacesAndNewlines)
}

func isValidWord(word: String) throws -> Bool {
    guard let encodedWord = word.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
        throw URLError(.badURL)
    }
    guard let url = URL(string: "https://script.google.com/macros/s/AKfycbzALYvS8HL5SXBc8mie5Ivj06l8zRbf7AsW4B1X5r5mil9l0QfmIHqnkaN9oG2sHnUG/exec?word=\(encodedWord)") else {
        throw URLError(.badURL)
    }
    let data = try Data(contentsOf: url)
    guard let responseString = String(data: data, encoding: .utf8) else {
        throw NSError(domain: "com.example", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response as UTF-8 string"])
    }
    // Check if the response is "true" or "false"
    return responseString.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "true"
}

