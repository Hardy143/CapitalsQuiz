//
//  ScoreViewModel.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import Foundation

class ScoreViewModel: ObservableObject {
    @Published private(set) var finalScore: Int
    private var score: Int
    
    init(score: Int = 0) {
        self.score = score
        self.finalScore = score
    }
    
    func updateScore(capital: Capital, country: Country) {
        guard capital.name == country.capital else { return }
        score += 10
        finalScore = score
        print("Score: \(score)")
    }
    
    func resetScore() {
        finalScore = 0
        score = 0
    }
}
