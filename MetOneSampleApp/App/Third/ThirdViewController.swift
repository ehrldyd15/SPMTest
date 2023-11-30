//
//  ThirdViewController.swift
//  MetOneSampleApp
//
//  Created by Do Kiyong on 11/30/23.
//

import UIKit
import SnapKit
import Combine

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello Third view controller")
        
        self.view.backgroundColor = .white
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    
}
