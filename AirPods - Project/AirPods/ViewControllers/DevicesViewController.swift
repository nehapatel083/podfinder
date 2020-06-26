//
//  DeviceViewController.swift
//  PodFinder
//
//  Created by Neha Patel on 05/19/20.
//  Copyright © 2020 Neha Patel. All rights reserved.
//

import UIKit

class DevicesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    let manager = BluetoothManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name("didUpdate"), object: nil, queue: nil) { (_) in
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.foundDevices.count /// number of found bluetooth devices
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? DeviceTableViewCell {
            cell.configure(name: manager.foundDevices[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    @IBAction func scanAgain(_ sender: UIButton) {
        if let window = (UIApplication.shared.delegate as? AppDelegate)?.window {
            window.rootViewController = storyboard?.instantiateViewController(withIdentifier: "scan")
        }
    }

}
