//
//  CounterViewModel.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import Foundation

class CounterViewModel: ObservableObject {
    
    @Published var count: Int = 0
    @Published var gameActive = true
    
    init(count: Int = 0) {
        self.count = count
    }
    
    func updateCount() {
        guard count < 11 else {
            gameActive = false
            return
            
        }
        count += 1
    }
    
}
