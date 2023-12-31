//
//  MainCoordinator.swift
//  MetOneSampleApp
//
//  Created by Do Kiyong on 11/24/23.
//

import Foundation
import UIKit

protocol MainCoordinatorDelegate {
    func moveSubView(_ coordinator: MainCoordinator)
    func moveThirdView(_ coordinator: MainCoordinator)
}

class MainCoordinator: Coordinator, MainViewControllerDelegate {
    
    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate?

    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.delegate = self
        
        self.navigationController?.pushViewController(viewController, animated: false)
    }
    
    func moveSubView() {
        self.delegate?.moveSubView(self)
    }
    
    func moveThirdView() {
        self.delegate?.moveThirdView(self)
    }
    
}

