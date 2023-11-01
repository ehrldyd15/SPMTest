//
//  MainCoordinatorDelegate.swift
//  MetOne
//
//  Created by Do Kiyong on 10/31/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []

    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "MainViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            navigationController.pushViewController(vc, animated: true)
        } else {
            print("Could not MainViewController: MainViewController")
        }
    }
    
}

