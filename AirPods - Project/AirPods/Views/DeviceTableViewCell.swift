//
//  DeviceTableViewCell.swift
//  PodFinder
//
//  Created by Neha Patel on 05/19/20.
//  Copyright © 2020 Neha Patel. All rights reserved.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {

    @IBOutlet var deviceNameLabel: UILabel!
    @IBOutlet var signalLabel: UILabel!
    
    func configure(name: String) {
        deviceNameLabel.text = name
        NotificationCenter.default.addObserver(forName: NSNotification.Name("signal"), object: nil, queue: nil) { (notification) in
            if let value = (notification.object as? [String: CGFloat])?[name] {
                self.signalLabel.text = "  \(String(format: "%.f", value))%  "
            }
        }
    }
    
}
