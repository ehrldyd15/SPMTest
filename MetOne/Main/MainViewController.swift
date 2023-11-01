//
//  MainViewController.swift
//  MetOne
//
//  Created by Do Kiyong on 11/1/23.
//

import UIKit

protocol MainViewControllerDelegate {
    func moveSubView()
}

class MainViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello main view controller")

    }
    
    @IBAction func moveSubView(_ sender: Any) {
        self.delegate?.moveSubView()
    }
    
}
