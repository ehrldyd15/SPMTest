//
//  SplashViewController.swift
//  MetOne
//
//  Created by Do Kiyong on 11/1/23.
//

import UIKit
import LoadingFeature

protocol SplashViewControllerDelegate {
    func moveMain()
}

class SplashViewController: UIViewController {
    
    var delegate: SplashViewControllerDelegate?
    
    let loadingView = LoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadingView.show()
        
        print("Hello splash view controller")
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (_) in
            self.loadingView.hide()
            self.delegate?.moveMain()
        }

    }
    
}
