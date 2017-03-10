//
//  MacAddress.swift
//  multihop app
//
//  Created by Jad on 3/10/17.
//  Copyright © 2017 Jad. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth
import CoreTelephony


open class MacAddress {
    
    let device = UIDevice()
    
    func getModel() -> String {
        return device.model
    }
    
    func getVersion() -> Bool? {
        let c = CTTelephonyNetworkInfo().subscriberCellularProvider?.accessibilityActivate()
        return c
    }
    
    
//    func getVersion() -> String? {
//        return device.systemVersion
//    }
    
    func getCarrier() -> String?{
        let carrier = CTTelephonyNetworkInfo().subscriberCellularProvider?.carrierName
        return carrier
    }
    
    
    
  

    
}
