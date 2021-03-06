//
//  TimerView.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 26/11/2020.
//

import SwiftUI

struct TimerView: View {

    @EnvironmentObject var countryViewModel: CountryViewModel
    @EnvironmentObject var gameStateController: GameStateController
    @EnvironmentObject var timerViewModel: TimerViewModel
        
    var body: some View {
        Text("\(timerViewModel.timer)")
            .font(.custom("Counter", size: 80))
            .fontWeight(.bold)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 50, trailing: 10))
        
            .onReceive(timerViewModel.$timer) { time in
                DispatchQueue.main.async {
                    if time == 0 {
                        self.gameStateController.updateCount()
                        
                        guard !gameStateController.isGameFinished else { return }
                        
                        self.countryViewModel.nextQuestion()
                        self.timerViewModel.startTimer()
                    }
                }
                
            }

    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
