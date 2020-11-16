//
//  CounterViewModel.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 16/11/2020.
//

import Foundation

class CounterViewModel: ObservableObject {
    
    @Published var count: Int
    
    init(count: Int = 0) {
        self.count = count
    }
    
    func updateCount() {
        count += 1
    }
}
