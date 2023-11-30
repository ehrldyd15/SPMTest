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
    func moveThirdView()
}

class MainViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    let moveSubViewButton = UIButton()
    let moveThirdViewButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello main view controller")
        
        view.backgroundColor = UIColor.metBackgroundColor
        
        self.setViews()
    }
    
    func setViews() {
        self.setViewStyle()
        
        view.addSubview(moveSubViewButton)
        view.addSubview(moveThirdViewButton)
        
        self.moveSubViewButton.snp.makeConstraints({
            $0.height.width.equalTo(100)
            $0.trailing.bottom.equalToSuperview().inset(30)
        })
        
        self.moveThirdViewButton.snp.makeConstraints({
            $0.height.width.equalTo(100)
            $0.leading.bottom.equalToSuperview().inset(30)
        })
    }
    
    func setViewStyle() {
        self.moveSubViewButton.backgroundColor = .systemBlue
        self.moveSubViewButton.layer.cornerRadius = 10
        
        self.moveThirdViewButton.backgroundColor = .systemBlue
        self.moveThirdViewButton.layer.cornerRadius = 10
        
        self.moveSubViewButton.addTarget(self, action: #selector(moveSubViewBtnTapped(_:)), for: .touchUpInside)
        self.moveThirdViewButton.addTarget(self, action: #selector(moveThirdViewBtnTapped(_:)), for: .touchUpInside)
        
    }
    
    @objc private func moveSubViewBtnTapped(_ sender: UIButton) {
        self.delegate?.moveSubView()
    }
    
    @objc private func moveThirdViewBtnTapped(_ sender: UIButton) {
        self.delegate?.moveThirdView()
    }
    
}

