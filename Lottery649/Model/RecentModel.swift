//
//  RecentData.swift
//  Lottery649
//
//  Created by Claire De Guzman on 2020-05-28.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import Foundation

class RecentModel {
    var winningNumbers: String
    let drawDate: String
    let bonusNumber: String
    let guaranteedWinNum: String
    let encoreNum: String
    let jackpot: Int
    let nameOfGame: String
    
    init(nGame: String, winNum: String, date: String, bonNum: String, gWinNum: String, encore: String, jNumb: Int) {
        self.nameOfGame = nGame
        self.winningNumbers = winNum
        self.drawDate = date
        self.bonusNumber = bonNum
        self.guaranteedWinNum = gWinNum
        self.encoreNum = encore
        self.jackpot = jNumb
    }
    
}
