//
//  SplashCoordinator.swift
//  MetOne
//
//  Created by Do Kiyong on 10/31/23.
//

import Foundation
import UIKit


protocol SplashCoordinatorDelegate {
    func moveMain(_ coordinator: SplashCoordinator)
}

class SplashCoordinator: Coordinator, SplashViewControllerDelegate {

    var childCoordinators: [Coordinator] = []
    var delegate: SplashCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
//        let viewController = SplashViewController()
//        viewController.view.backgroundColor = .white
//        viewController.delegate = self
//        
//        self.navigationController.viewControllers = [viewController]
        let storyboard = UIStoryboard(name: "SplashViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController {
            vc.delegate = self

            navigationController.pushViewController(vc, animated: true)
        } else {
            print("Could not SplashViewController: SplashViewController")
        }
    }
    
    func moveMain() {
        self.delegate?.moveMain(self)
    }
    
}
