//
//  MainViewController.swift
//  PodFinder
//
//  Created by Neha Patel on 05/19/20.
//  Copyright © 2020 Neha Patel. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBAction func startScanning(_ sender: UIButton) {
        if let window = (UIApplication.shared.delegate as? AppDelegate)?.window {
            window.rootViewController = storyboard?.instantiateViewController(withIdentifier: "scan")
        }
    }
    
}

