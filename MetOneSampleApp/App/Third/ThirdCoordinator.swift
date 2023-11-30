//
//  ThirdCoordinator.swift
//  MetOneSampleApp
//
//  Created by Do Kiyong on 11/30/23.
//

import Foundation
import UIKit

class ThirdCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []

    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = false
    }
    
    func start() {
        let viewController = ThirdViewController()
        self.navigationController?.pushViewController(viewController, animated: false)
    }
    
}
