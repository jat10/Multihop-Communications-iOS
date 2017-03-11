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
import Contacts


open class phoneInfo {
    
    let device = UIDevice()
    
    let contact = CNMutableContact()
    
    func getModel() -> String {
        return device.model
    }
    
    func getVersion() -> String {
        return device.systemVersion
    }
    
    func getNetworkCode() -> String? {
        let networkCode = CTTelephonyNetworkInfo().subscriberCellularProvider?.mobileNetworkCode
        return networkCode
    }
    
    
    func getCarrier() -> String?{
        let carrier = CTTelephonyNetworkInfo().subscriberCellularProvider?.carrierName
        return carrier
    }
    
    func getIsoCountryCode() -> String? {
        let iso = CTTelephonyNetworkInfo().subscriberCellularProvider?.isoCountryCode
        return iso
    }
    
}
