//
//  LotteryBrain.swift
//  Lottery649
//
//  Created by Claire De Guzman on 2020-05-26.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

class LotteryBrain {
    
    var lotteryResults2: [Lottery] = []
    
    func generateRandomNumbers() -> [Int] {
        var myResults = [Int]()
        while myResults.count != 6 {
            let myNumber = Int.random(in: 0..<49)
            if !myResults.contains(myNumber) {
                myResults.append(myNumber)
                
            }
            
        }
        
        return myResults
        
    }
    
    func createData() -> [Lottery] {
        
        var numbersGenerated = generateRandomNumbers()
        numbersGenerated.sort(by: <)
        var indexOfArray = 0
        
        while lotteryResults2.count != 6 {
            let number = String(numbersGenerated[indexOfArray])
            indexOfArray += 1
            print(number)
            var newItem = Lottery(label: number)
            lotteryResults2.append(newItem)
        }
        
        return lotteryResults2
    }
    
    
}
