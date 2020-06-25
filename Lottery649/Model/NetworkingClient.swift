//
//  NetworkingClient.swift
//  Lottery649
//
//  Created by Claire De Guzman on 2020-05-27.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkingClient {
    
    typealias webServiceResponse = (RecentData?, Error?) -> Void
    
    func gatherData(completionHandler: @escaping webServiceResponse ) {
        
        
        let baseURL = "https://www.lotterytracker.ca/api/winningNumbers/?recent=true&provinceCode=ON&format=JSON"
        
        
        AF.request(baseURL).responseJSON { response in
            switch response.result {
            case.success(let value):
                let json = JSON(value)
                let data = [RecentData]()
                for (_ , content) in json {
                    let result = RecentData(gName: content["Draw"]["Game"]["Name"].string,date: content["Draw"]["FormattedDate"].string, numbers: content["Regular"].string , bNumb: content["Bonus"].string, gWinNum: content["GuaranteedWinning"].string, encNum: content["Encore"].string, jackpot: (content["Jackpot"]).int)
                    
                    completionHandler(result, nil)
                }
            case .failure(let error):
                print(error)
                completionHandler(nil, error as NSError)
            }
        }
        
    }
    
    
    
    
}

