//
//  TimerViewModel.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 26/11/2020.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    
    @Published var timer = 10
    var gameTimer: AnyCancellable?
    
    init(timer: Int = 10) {
        tenSecondTimer()
    }
    
    func tenSecondTimer() {
        gameTimer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if self.timer > 0 {
                    self.timer -= 1
                } else {
                    self.gameTimer?.cancel()
                }
            }
    }
}
