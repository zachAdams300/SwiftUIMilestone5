//
//  RollDiceView.swift
//  SwiftUIMilestone5
//
//  Created by Zachary Adams on 1/27/24.
//

import SwiftUI

struct RollDiceView: View {
    private let sideOptions = [4, 6, 8, 10, 12, 20, 100]
    
    @State private var numSides = 4
    @State private var numDice = 1
    @State private var rollResults = [RollResult]()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timeRemaining = 3
    @State private var timerRunning = false
    
    @EnvironmentObject var rollResultList: RollResults
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Die customizing") {
                    Picker("How many sides per die?", selection: $numSides) {
                        ForEach(sideOptions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    Stepper("\(numDice) \(numDice == 1 ? "die" : "dice")", value: $numDice, in: 1...20)
                    
                    Button("Roll Dice") {
                        timeRemaining = 3
                        timerRunning = true
                    }
                }
                if rollResults.count > 0 {
                    Section("Results") {
                        ForEach(rollResults, id:\.id) { roll in
                            Text("\(timerRunning ? "" : "Final Result: ") \(roll.numRolled)")
                        }
                    }
                }
            }
            .onReceive(timer, perform: { time in
                if timeRemaining > 0 && timerRunning {
                    timeRemaining -= 1
                    rollDice(isFinalResult: timeRemaining == 0)
                }
            })
        }
    }
    
    func rollDice(isFinalResult: Bool) {
        rollResults.removeAll()
        for _ in 0..<numDice {
            let roll = Int.random(in: 1...numSides)
            rollResults.insert(RollResult(numRolled: roll), at: 0)
            
            if isFinalResult {
                timerRunning = false
                rollResultList.addRoll(roll: roll)
            }
        }
    }
}

#Preview {
    RollDiceView()
}
