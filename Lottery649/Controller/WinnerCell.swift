//
//  WinnerCell.swift
//  Lottery649
//
//  Created by Claire De Guzman on 2020-05-27.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

class WinnerCell: UITableViewCell {
    
    var cellLabel : UILabel = {
        var cellLab = UILabel()
        cellLab.font = UIFont.boldSystemFont(ofSize: 18)
        cellLab.textAlignment = .center
        cellLab.textColor = .white
        cellLab.numberOfLines = 0
        
        
        return cellLab
    }()
    
    var cellLabelSpec: [NSLayoutConstraint]?

    func cellLabelSpecs() {
        addSubview(cellLabel)
        updateLabelFrame()
        
        cellLabelSpec = cellLabel.anchor(centerYAnchor, left:nil, bottom: nil, right: nil, topConstant: -15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 400, heightConstant: 30)
    
    }
    

    func updateLabelFrame() {
        let maxSize = CGSize(width: 30, height: 30)
        let size = cellLabel.sizeThatFits(maxSize)
        cellLabel.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: size)
    }
    
   
    
}



