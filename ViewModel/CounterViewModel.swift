//
//  CounterViewModel.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import Foundation

class CounterViewModel: ObservableObject {
    
    @Published private(set) var count: Int
    @Published private(set) var isGameActive = true
    
    init(count: Int = 1) {
        self.count = count
    }
    
    func updateCount() {
        guard count < 10 else {
            isGameActive = false
            return
            
        }
        count += 1
        print("Count: \(count)")
    }
    
}
