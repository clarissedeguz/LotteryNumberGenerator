//
//  ViewController.swift
//  Lottery649
//
//  Created by Claire De Guzman on 2020-05-25.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

class LotteryViewController: UIViewController {
    
    let cellId = "lotteryCell"
    var lotteryResults: [Lottery] = []
    var lotteryBrain = LotteryBrain()
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 125.5, left: 20, bottom: 19, right: 30)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 60
        
        let cv = UICollectionView(frame:.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 215/255, alpha: 1)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let imageView : UIImageView = {
        let ivBG = UIImageView()
        ivBG.image = UIImage(named:"background_2")
        ivBG.contentMode = .scaleAspectFill
        return ivBG
    }()
    
    
    var rollButton: UIButton = {
        let rbtn = UIButton(type: .system)
        rbtn.setTitle("ROLL", for: .normal)
        rbtn.setTitleColor(.white, for: .normal)
        rbtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return rbtn
    }()
    
    var useButton: UIButton = {
        var usebtn = UIButton(type: .system)
        usebtn.setTitle("Use", for: .normal)
        usebtn.setTitleColor(.green, for: .normal)
        return usebtn
    }()
    
    
    @objc func buttonPressed() {
        lotteryResults = lotteryBrain.createData()
        self.collectionView.reloadData()
        lotteryBrain.lotteryResults2.removeAll()
        
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundView = imageView
        view.addSubview(collectionView)
        cvSpecs()
        view.addSubview(rollButton)
        view.addSubview(useButton)
        buttonSpecs()
        registerCells()
    
    }
    
    
    func cvSpecs() {
        
        collectionView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier:  0).isActive = true
        collectionView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        collectionView.contentInset.top = -10
        collectionView.contentInset.bottom = 60
    }
    
    func buttonSpecs(){
        let rollButtonSpecs =  rollButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: -40, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 130).first
        let useButtonSpecs = useButton.anchor(collectionView.topAnchor, left: nil, bottom: nil, right: collectionView.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 50, widthConstant: 60, heightConstant: 130).first
        
        
        
    }
    
}


//MARK: - UICollectionViewDelegate
extension LotteryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //how many cells we want to return
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lotteryResults.count
    }
    
    //deque and use cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let lotteryCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LotteryCell
        
        let newItem = lotteryResults[indexPath.item]
        lotteryCell.setupCell(Lottery: newItem)
        
        return lotteryCell
        
    }
    
    func registerCells() {
        collectionView.register(LotteryCell.self, forCellWithReuseIdentifier: cellId)
        print("cell registered")
    }
    
    
    
    //modify the cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 2
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(4))
        
        return CGSize(width: size, height: size)
    }
    

    
}

