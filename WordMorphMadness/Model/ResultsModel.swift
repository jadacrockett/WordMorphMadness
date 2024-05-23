//
//  ResultsModel.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 5/20/24.
//

import Foundation

func getHighScore(score: Int, key: String) -> Int {
    if let highScore = UserDefaults.standard.object(forKey: key) as? Int {
        if score > highScore {
            UserDefaults.standard.setValue(score, forKey: key)
            return score
        } else {
            return highScore
        }
    } else {
        UserDefaults.standard.setValue(score, forKey: key)
        return score
    }
}
