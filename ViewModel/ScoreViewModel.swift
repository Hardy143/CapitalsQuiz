//
//  ScoreViewModel.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import Foundation

class ScoreViewModel: ObservableObject {
    @Published var finalScore: Int
    private var score = 0
    
    init(score: Int = 0) {
        self.finalScore = score
    }
    
    func updateScore(capital: Capital, country: Country) {
        guard capital.name == country.capital else { return }
        score += 10
        print(score)
    }
    
    func calculateFinalScore() {
        finalScore = score
    }
    
    func resetScore() {
        finalScore = 0
        score = 0
    }
}
