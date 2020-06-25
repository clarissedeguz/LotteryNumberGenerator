//
//  RecentWin.swift
//  Lottery649
//
//  Created by Claire De Guzman on 2020-05-27.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

class RecentWinController: UIViewController {
    
    let tableView = UITableView()
    var buttonAnchor : NSLayoutConstraint?
    let cellId = "winnerCell"
    var winnerCell = WinnerCell()
    var networkingClient = NetworkingClient()
    var lotteryVC = LotteryViewController()
    var info: [RecentModel] = []
    var results:[RecentModel] = []
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0).isActive = true
        tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier:  0).isActive = true
        tableView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 40).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.isScrollEnabled = false
        
    }
    
    var backgroundImageView: UIImageView = {
        let bgIV = UIImageView()
        bgIV.contentMode = .scaleAspectFit
        bgIV.image = UIImage(named:"background_2")
        bgIV.contentMode = .scaleAspectFill
        return bgIV
    }()
    
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(vcSegue), for: .touchUpInside)
        button.setTitle("ROLL", for: .normal)
        return button
    }()
    
    
    @objc func vcSegue() {
        print("test test WORKS!")
        let vc = LotteryViewController()
        self.present(vc, animated: true, completion: nil)

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RVC")
        self.tableView.backgroundView = backgroundImageView
        setupTableView()
        networkingData()
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(button)
        registerCells()
        
        buttonAnchor = button.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: -40, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 130).first
        
    }
    
    func networkingData() {
        
        print(Thread.current)
        
        
        networkingClient.gatherData() { (json, Error) in
            if let error = Error {
                print(error)
                
            } else if let json = json {
                
                var data : RecentData
                data = json
                
                print("working")
                let recentData = RecentModel(nGame: data.gameName ?? "error", winNum: data.drawNumbers ?? "error", date: data.drawDate ?? "error", bonNum: data.bonusNumber ?? "N/A" , gWinNum: data.guaranteedWinNum ?? "N/A", encore: data.encoreNum ?? "N/A" , jNumb: data.jackpot ?? 0 )
                
                self.info.append(recentData)
                print(recentData.drawDate)
                
            }
            DispatchQueue.main.async {
                
                
                var count = 0
                
                while self.results.count != 5 {
                    let infoItem = self.info[count]
                    count += 1
                    self.results.append(infoItem)
                }
                
                self.tableView.reloadData()
                
            }
            
        }
    }
    
}




//MARK: - UITableViewDelegate

extension RecentWinController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let winnerCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WinnerCell
        winnerCell.cellLabelSpecs()
        winnerCell.backgroundColor = .clear
        
        if results.count == 5 {
            
            
            
            switch indexPath.row {
            case 0:
                winnerCell.backgroundColor =  UIColor.init(red: 242/255, green: 247/255, blue: 248/255, alpha: 0.3)
                winnerCell.cellLabel.font = winnerCell.cellLabel.font.withSize(30)
                winnerCell.cellLabel.textColor = UIColor.init(red: 32/255, green: 40/255, blue: 50/255, alpha: 1)
                
                winnerCell.cellLabel.text = results[indexPath.section].drawDate
            case 1:
                winnerCell.cellLabel.font = UIFont.boldSystemFont(ofSize: 25)
                
                winnerCell.cellLabel.text = results[indexPath.section].nameOfGame
            case 2:
                winnerCell.cellLabel.text = "\(results[indexPath.section].winningNumbers) Bonus:\(results[indexPath.section].bonusNumber)"
            case 3:
                //                winnerCell.cellLabel.text = "Bonus Numbers: \(results[indexPath.section].bonusNumber)"
                winnerCell.cellLabel.text = "Guaranteed Winning Number: \(results[indexPath.section].guaranteedWinNum)"
                //            case 4:
            //                 winnerCell.cellLabel.text = "Encore Numbers: \(results[indexPath.section].encoreNum)"
            default:
                winnerCell.cellLabel.text = "Encore Numbers: \(results[indexPath.section].encoreNum)"
                //                winnerCell.cellLabel.text = "Guaranteed Winning Number: \(results[indexPath.section].guaranteedWinNum)"
            }
            
        }
        
        return winnerCell
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    
    
    func registerCells() {
        tableView.register(WinnerCell.self, forCellReuseIdentifier: cellId)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        //        headerView.backgroundColor = UIColor.init(red: 28/255, green: 119/255, blue: 195/255, alpha: 0.8)
        
        let label = UILabel()
        label.backgroundColor = .clear
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = ""
        label.textColor = .black
        headerView.addSubview(label)
        
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section != 0 {
            return 0
        } else {
            return 50
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 25
    }
    
}









