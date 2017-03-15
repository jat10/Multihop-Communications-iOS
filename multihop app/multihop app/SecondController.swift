//
//  SecondController.swift
//  multihop app
//
//  Created by Jad on 3/10/17.
//  Copyright © 2017 Jad. All rights reserved.
//

import UIKit
import CoreBluetooth




class SecondController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    struct cellData {
        let cell : Int!
        let text : String!
        let image: UIImage?
        let index : Int!
    }
    

    var arrayOfCellData = [cellData]()
    
    var manager: CBCentralManager!
    var isBluetoothEnabled = false
    var visiblePeripheralUUIDs = NSMutableOrderedSet()
    var visiblePeripherals = [String: Peripheral]()
    var scanTimer: Timer?
    var connectionAttemptTimer: Timer?
    var connectedPeripheral: CBPeripheral?
    
   
    
    override func viewDidLoad() {
        arrayOfCellData = [
            cellData(cell:2, text:"Model",image: nil, index: 1),
            cellData(cell:2, text:"Version",image: nil, index: 2),
            cellData(cell:2, text:"Network Code",image: nil, index: 3),
            cellData(cell:2, text:"Carrier",image: nil, index: 4),
            cellData(cell:2, text:"Iso Country Code",image: nil, index: 5)
        ]
        

        
      
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (arrayOfCellData.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = Bundle.main.loadNibNamed("infoTableViewCell", owner: self, options: nil)?.first as! infoTableViewCell
            let info = phoneInfo()
            
            cell.mainLabel.text = arrayOfCellData[indexPath.row].text
            
            switch arrayOfCellData[indexPath.row].index {
            case 1:
                cell.infoLabel.text = info.getModel()
            case 2:
                cell.infoLabel.text = info.getVersion()
            case 3:
                cell.infoLabel.text = info.getNetworkCode()
            case 4:
                cell.infoLabel.text = info.getCarrier()
            case 5:
                cell.infoLabel.text = info.getIsoCountryCode()
            default:
                 cell.infoLabel.text = "No Data Found"
            }
            
            return cell
        
    }
    
    
    

}
