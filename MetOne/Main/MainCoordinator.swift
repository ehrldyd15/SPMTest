//
//  MainCoordinatorDelegate.swift
//  MetOne
//
//  Created by Do Kiyong on 10/31/23.
//

import Foundation
import UIKit

protocol MainCoordinatorDelegate {
    func moveSubView(_ coordinator: MainCoordinator)
}

class MainCoordinator: Coordinator, MainViewControllerDelegate {
    
    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate?

    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "MainViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            vc.delegate = self
            
            navigationController.pushViewController(vc, animated: false)
        } else {
            print("Could not MainViewController: MainViewController")
        }
    }
    
    func moveSubView() {
        self.delegate?.moveSubView(self)
    }
    
}

