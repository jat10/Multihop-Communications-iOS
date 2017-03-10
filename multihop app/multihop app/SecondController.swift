//
//  SecondController.swift
//  multihop app
//
//  Created by Jad on 3/10/17.
//  Copyright © 2017 Jad. All rights reserved.
//

import UIKit



class SecondController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    struct cellData {
        let cell : Int!
        let text : String!
        let image: UIImage!
    }
    

    var arrayOfCellData = [cellData]()
    
    override func viewDidLoad() {
        arrayOfCellData = [cellData(cell:1, text:"Internet",image: #imageLiteral(resourceName: "logo-btn")),
                           cellData(cell:1, text:"Bluetooth",image: #imageLiteral(resourceName: "Bluetooth")),
                           cellData(cell:2, text:"Version",image: #imageLiteral(resourceName: "Bluetooth"))]
        

        
      
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (arrayOfCellData.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if arrayOfCellData[indexPath.row].cell == 1{
            let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabel.text = arrayOfCellData[indexPath.row].text
            
            if Reachability.isConnectedToNetwork() == true {
                cell.mainSwitch.setOn(true, animated: false)
            } else{
                cell.mainSwitch.setOn(false, animated: false)
            }
            
            return cell
            
        } else if arrayOfCellData[indexPath.row].cell == 2 {
            let cell = Bundle.main.loadNibNamed("infoTableViewCell", owner: self, options: nil)?.first as! infoTableViewCell
            let x = MacAddress()
                cell.mainLabel.text = arrayOfCellData[indexPath.row].text
                cell.infoLabel.text = x.getVersion()?.description
            
            return cell
        } else {
         let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
            
            return cell
        
        }
        
    }
    
    
    

}
