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
    @ObservedObject var countryViewModel: CountryViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Final Score: \(scoreViewModel.finalScore)")
                
                Button(action: {
                    gameStateController.resetGame()
                    scoreViewModel.resetScore()
                    countryViewModel.nextQuestion()
                }) {
                    Text("Play Again")
                        .navigationBarHidden(true)
                }
            }
            
        }
        
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(countryViewModel: CountryViewModel())
    }
}
