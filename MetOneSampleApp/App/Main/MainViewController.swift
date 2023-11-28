//
//  MainViewController.swift
//  MetOneSampleApp
//
//  Created by Do Kiyong on 11/24/23.
//

import UIKit
import SnapKit
import MetFoundation

protocol MainViewControllerDelegate {
    func moveSubView()
}

class MainViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    let myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello main view controller")
        
        view.backgroundColor = UIColor.metBackgroundColor
    }
    
}

