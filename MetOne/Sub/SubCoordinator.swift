//
//  SubCoordinator.swift
//  MetOne
//
//  Created by Do Kiyong on 11/1/23.
//

import Foundation
import UIKit

class SubCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []

    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "SubViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "SubViewController") as? SubViewController {
            navigationController.pushViewController(vc, animated: true)
        } else {
            print("Could not SubViewController: SubViewController")
        }
    }
    
}
