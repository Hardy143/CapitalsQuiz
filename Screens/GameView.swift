//
//  GameView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var countryViewModel: CountryViewModel
    @EnvironmentObject var timerViewModel: TimerViewModel
    @EnvironmentObject var gameStateController: GameStateController
    @EnvironmentObject var scoreViewModel: ScoreViewModel
    
    var body: some View {
            
        VStack(alignment: .center, spacing: 20) {
            CountryView()
            
            List(countryViewModel.capitals) { capital in
                CapitalRow(capital: capital)
            }
            
            .onTapGesture {
                gameStateController.updateCount()
                
                guard !gameStateController.isGameFinished else { return }
            
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.countryViewModel.nextQuestion()
                    self.timerViewModel.startTimer()
                }
            }
            .listStyle(InsetListStyle())
            
            TimerView()
            
            Spacer()
            
        }

        
        NavigationLink(
            destination: ScoreView(),
            isActive: $gameStateController.isGameFinished) {
            
        }
        .navigationBarBackButtonHidden(true)
        
        .onAppear(perform: {
            timerViewModel.startTimer()
        })


    }

}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
