//
//  LotteryCell.swift
//  Lottery649
//
//  Created by Claire De Guzman on 2020-05-25.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

class LotteryCell: UICollectionViewCell {
    
    var lottery: Lottery?
    
    var imageView: UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "lotteryBall")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    var label: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = label.font.withSize(25)
        label.adjustsFontSizeToFitWidth = false
        
        return label
    }()
    
    func setupCell(Lottery: Lottery) {
        addSubview(imageView)
        addSubview(label)
        
        var imageViewSpecs = imageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        var labelSpecs = label.anchor(nil, left:nil, bottom: centerYAnchor , right: centerXAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        label.text = Lottery.label
        
        
    }
    
    
    
    
    
    
    
    
    
}
