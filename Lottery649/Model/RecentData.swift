//
//  RecentModel.swift
//  Lottery649
//
//  Created by Claire De Guzman on 2020-05-28.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import Foundation

class RecentData {
    let drawDate: String?
    let drawNumbers: String?
    let bonusNumber: String?
    let guaranteedWinNum: String?
    let encoreNum: String?
    let jackpot: Int?
    let gameName: String?
    
    init(gName: String?,date: String?, numbers: String?, bNumb: String?, gWinNum: String?, encNum: String?, jackpot: Int?){
        self.gameName = gName
        self.drawDate = date
        self.drawNumbers = numbers
        self.bonusNumber = bNumb
        self.guaranteedWinNum = gWinNum
        self.jackpot = jackpot
        self.encoreNum = encNum
    }
    
    
}





