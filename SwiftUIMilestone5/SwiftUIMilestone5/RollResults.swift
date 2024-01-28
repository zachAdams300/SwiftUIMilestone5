//
//  RollResults.swift
//  SwiftUIMilestone5
//
//  Created by Zachary Adams on 1/27/24.
//

import Foundation

@Observable
class RollResults: ObservableObject {
    
    private(set) var rollResultList: [RollResult]
    let saveKey = "SavedData"
    
    init() {
        do {
            let url = URL.documentsDirectory.appending(path: saveKey)
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([RollResult].self, from: data)
            
            rollResultList = decoded
        }catch {
            rollResultList = []
        }
    }
    
    func addRolls(rollArray: [Int]) {
        for result in rollArray {
            rollResultList.append(RollResult(numRolled: result))
        }
        save()
    }
    
    func addRoll(roll: Int) {
        rollResultList.append(RollResult(numRolled: roll))
        save()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(rollResultList) {
            do {
                try encoded.write(to: URL.documentsDirectory.appending(path: saveKey))
            }catch {
                print("UH OH")
            }
        }else {
            
        }
    }
}
