//
//  ViewRouter.swift
//  CombineAndSwiftUI
//
//  Created by Vicki Larkin on 03/12/2020.
//

import Foundation

class GameStateController: ObservableObject {
    
    @Published private(set) var count: Int
    @Published var isGameFinished = false
    
    init(count: Int = 1) {
        self.count = count
    }
    
    func updateCount() {
        guard count < 10 else {
            isGameFinished = true
            return
            
        }
        count += 1
        print("Count: \(count)")
    }
    
    func resetGame() {
        count = 1
        isGameFinished = false
    }
}
