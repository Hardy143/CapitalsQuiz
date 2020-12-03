//
//  ScoreView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 27/11/2020.
//

import SwiftUI

struct ScoreView: View {
    
    @EnvironmentObject var scoreViewModel: ScoreViewModel
    @EnvironmentObject var gameStateController: GameStateController
    @EnvironmentObject var countryViewModel: CountryViewModel
    
    var body: some View {
        VStack {
            Text("Final Score: \(scoreViewModel.finalScore)")
            
            Button(action: {
                gameStateController.resetGame()
                scoreViewModel.resetScore()
                countryViewModel.nextQuestion()
            }) {
                Text("Play Again")
            }
            
        }
        
        .navigationBarBackButtonHidden(true)
        
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
