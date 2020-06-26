//
//  ScanViewController.swift
//  PodFinder
//
//  Created by Neha Patel on 05/19/20.
//  Copyright © 2020 Neha Patel. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /// First layer
        animateLayer(layer: generateAnimationLayer())
        
        /// Second layer
        animateLayer(layer: generateAnimationLayer(), delay: 0.3)
        
        
        /// Animate for 'x' seconds then show devices screen
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if let window = (UIApplication.shared.delegate as? AppDelegate)?.window {
                window.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "devices")
            }
        }
    }
    
    
    private func animateLayer(layer: UIView, delay: TimeInterval = 0.0) {
        UIView.animate(withDuration: 1.5, delay: delay, animations: {
            layer.transform = CGAffineTransform(scaleX: 100, y: 100)
            layer.center = self.view.center
            layer.alpha = 0.1
        }) { (_) in
            layer.transform = CGAffineTransform.identity
            layer.center = self.view.center
            layer.alpha = 1.0
            self.animateLayer(layer: layer, delay: delay)
        }
    }

    private func generateAnimationLayer() -> UIView {
        let animationLayer = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        animationLayer.backgroundColor = .link
        animationLayer.center = view.center
        animationLayer.layer.cornerRadius = animationLayer.frame.width/2
        view.addSubview(animationLayer)
        view.sendSubviewToBack(animationLayer)
        return animationLayer
    }
}
