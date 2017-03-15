//
//  BluetoothTableViewController.swift
//  multihop app
//
//  Created by Jad on 3/14/17.
//  Copyright © 2017 Jad. All rights reserved.
//

import UIKit
import CoreBluetooth

struct Peripheral
{
    var peripheral: CBPeripheral
    var name: String?
    var UUID: String
    var RSSI: String
    var connectable = "No"
    
    init(peripheral: CBPeripheral, RSSI: String, advertisementDictionary: NSDictionary)
    {
        self.peripheral = peripheral
        name = peripheral.name ?? "No name."
        UUID = peripheral.identifier.uuidString
        self.RSSI = RSSI
        if let isConnectable = advertisementDictionary[CBAdvertisementDataIsConnectable] as? NSNumber
        {
            connectable = (isConnectable.boolValue) ? "Yes" : "No"
        }
    }
}

struct cellData {
    let cell : Int!
    let text : String!
    let image: UIImage?
    let index : Int!
}


class BluetoothTableViewController: UITableViewController, CBCentralManagerDelegate {

    var manager: CBCentralManager!
    var isBluetoothEnabled = false
    var visiblePeripheralUUIDs = NSMutableOrderedSet()
    var visiblePeripherals = [String: Peripheral]()
    var scanTimer: Timer?
    var connectionAttemptTimer: Timer?
    var connectedPeripheral: CBPeripheral?
    
    var arrayOfCellData = [cellData]()
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        manager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey: true])
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        manager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey: true])
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        arrayOfCellData = [
            cellData(cell:1, text:"Internet",image: #imageLiteral(resourceName: "logo-btn"), index: 0),
            cellData(cell:1, text:"Bluetooth",image: #imageLiteral(resourceName: "Bluetooth"), index: 0)
        ]
       
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        if isBluetoothEnabled
        {
            if let peripheral = connectedPeripheral
            {
                manager.cancelPeripheralConnection(peripheral)
            }
        }
    }
    
    func startScanning()
    {
        print("Started scanning.")
        visiblePeripheralUUIDs.removeAllObjects()
        visiblePeripherals.removeAll(keepingCapacity: true)
        tableView.reloadData()
        manager.scanForPeripherals(withServices: nil, options: nil)
        scanTimer = Timer.scheduledTimer(timeInterval: 40, target: self, selector: #selector(BluetoothTableViewController.stopScanning), userInfo: nil, repeats: false)
    }
    
    func stopScanning()
    {
        print("Stopped scanning.")
        print("Found \(visiblePeripherals.count) peripherals.")
        manager.stopScan()
        refreshControl?.endRefreshing()
        scanTimer?.invalidate()
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager)
    {
        var printString: String
        switch central.state
        {
        case .poweredOff:
            printString = "Bluetooth hardware power off."
            isBluetoothEnabled = false
        case .poweredOn:
            printString = "Bluetooth hardware power on."
            isBluetoothEnabled = true
            startScanning()
        case .resetting:
            printString = "Bluetooth hardware resetting."
            isBluetoothEnabled = false
        case .unauthorized:
            printString = "Bluetooth hardware unauthorized."
            isBluetoothEnabled = false
        case .unsupported:
            printString = "Bluetooth hardware not supported."
            isBluetoothEnabled = false
        case .unknown:
            printString = "Bluetooth hardware state unknown."
            isBluetoothEnabled = false
        }
        
        print("State updated to: \(printString)")
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrayOfCellData.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.mainImageView.image = arrayOfCellData[indexPath.row].image
        cell.mainLabel.text = arrayOfCellData[indexPath.row].text
        
        if arrayOfCellData[indexPath.row].text == "Internet"{
            if Reachability.isConnectedToNetwork() == true {
                cell.mainSwitch.setOn(true, animated: false)
            } else{
                cell.mainSwitch.setOn(false, animated: false)
            }
        } else {
            if isBluetoothEnabled == true{
                 cell.mainSwitch.setOn(true, animated: false)
            } else{
                 cell.mainSwitch.setOn(false, animated: false)
            }
            
        }
        
        
        
        return cell

    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
