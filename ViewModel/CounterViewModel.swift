//
//  CounterViewModel.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import Foundation

class CounterViewModel: ObservableObject {
    
    @Published var count: Int = 10
    
    init(count: Int = 0) {
        self.count = count
    }
    
    func updateCount() {
        count += 1
    }
    
    func tenSecondTimer() {
        let timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if self.count > 0 {
                    self.count -= 1
                }
            }
    }
}
