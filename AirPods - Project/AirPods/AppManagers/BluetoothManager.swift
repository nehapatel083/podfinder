//
//  BluetoothManager.swift
//  PodFinder
//
//  Created by Neha Patel on 05/19/20.
//  Copyright © 2020 Neha Patel. All rights reserved.
//

import UIKit
import CoreBluetooth

class BluetoothManager: NSObject, CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        /// updates when bluetooth state changes. when state changes start scanning
        manager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey : true])
    }

    let manager = CBCentralManager()
    var foundDevices = [String]()
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let name = peripheral.name {
            if foundDevices.contains(name) == false {
                foundDevices.append(name)
                NotificationCenter.default.post(name: NSNotification.Name("didUpdate"), object: nil)
            }
            
            let max = 80.0 // max signal strength
            let min = 40.0
            let normalRSSI = (abs(RSSI.doubleValue) - min) / (max - min)
            let signal = CGFloat(1 - round(normalRSSI * 10.0) / 10.0) * 100.0
            let formattedSignal = signal > 100.0 ? 100.0 : (signal < 0.0 ? 0.0 : signal)
            /// if > 100 return 100 if less than 0 return 0 otherwise return the signal value
            
            let signalData = [name: formattedSignal]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "signal"), object: signalData)
        }
    }
}
