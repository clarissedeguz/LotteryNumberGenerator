//
//  ViewController.swift
//  Lottery649
//
//  Created by Claire De Guzman on 2020-05-25.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

//protocol LotteryBrainDelegate {
//    func generateRandomNumbers()
//    func createData(lotArray: [Lottery]) -> Lottery
//}

class LotteryViewController: UIViewController {
    let cellId = "lotteryCell"
    var lotteryResults: [Lottery] = []
    var lotteryBrain = LotteryBrain()
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 130, left: 20, bottom: 19.5, right: 30)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 35
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
    
//    let imageViewLogo: UIImageView = {
//        let ivL = UIImageView()
//        ivL.image = UIImage(named: "lotto-649")
//        ivL.contentMode = .scaleAspectFit
//        return ivL
//    }()
    
    
    var rollButton: UIButton = {
        let rbtn = UIButton(type: .system)
        rbtn.setTitle("Roll", for: .normal)
        rbtn.setTitleColor(.red, for: .normal)
        rbtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return rbtn
    }()
    
    
    @objc func buttonPressed() {
        lotteryResults = lotteryBrain.createData()
        self.collectionView.reloadData()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundView = imageView
//        view.addSubview(imageViewLogo)
//        logoSpecs()
        view.addSubview(collectionView)
        cvSpecs()
        view.addSubview(rollButton)
        rollButtonSpecs()
        registerCells()
    
    }
    
    
    func cvSpecs() {
        
        collectionView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier:  0).isActive = true
        collectionView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
    }
    
    func rollButtonSpecs(){
        let rollButtonSpecs = rollButton.anchor(collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 130).first
        
    }
    
//    func logoSpecs() {
//        let logoSpecs = imageViewLogo.anchor(collectionView.topAnchor, left: nil, bottom: nil, right: collectionView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 130, heightConstant: 130)
//
//    }
    
    
    
    
    
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
        
       
        print("bg is set")
        
        let newItem = lotteryResults[indexPath.item]
        print(newItem)
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

