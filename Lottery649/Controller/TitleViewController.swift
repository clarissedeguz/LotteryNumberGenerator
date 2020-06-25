//
//  TitleViewController.swift
//  Lottery649
//
//  Created by Claire De Guzman on 2020-06-18.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    
  var button: UIButton = {
        let segueButton = UIButton(type: .system)
        segueButton.setTitleColor(.red, for: .normal)
        segueButton.addTarget(self, action: #selector(vcSegue), for: .touchUpInside)
        segueButton.setTitle("Segue", for: .normal)
        return segueButton
    }()
    
    @objc func vcSegue() {
          print("test test WORKS!")
            let vc = RecentWinController()
            self.present(vc, animated: true, completion: nil)
      }
    
    var buttonAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        print("TVC")
        super.viewDidLoad()
        view.addSubview(button)
        buttonAnchor = button.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 130).first
    }
    
    
        
    }
    
    
    
    

