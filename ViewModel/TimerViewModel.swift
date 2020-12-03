//
//  TimerViewModel.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 26/11/2020.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    
    @Published private(set) var timer: Int
    var gameTimer: AnyCancellable?
    
    init(timer: Int = 5) {
        self.timer = timer
    }
    
    func startTimer(seconds: Int = 5) {
        gameTimer?.cancel()
        timer = seconds
        
        gameTimer = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .sink { _ in
                
                guard self.timer > 0 else {
                    self.gameTimer?.cancel()
                    self.timer = 0
                    return
                }

                self.timer -= 1
            }
    }
}
