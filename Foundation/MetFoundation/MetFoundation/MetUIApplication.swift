//
//  MetUIApplication.swift
//  MetFoundation
//
//  Created by Do Kiyong on 11/8/23.
//

import Foundation
import UIKit

extension UIApplication {
    
    public static func getPresentedViewController() -> UIViewController? {
        var presentViewController = UIApplication.shared.keyWindow?.rootViewController
        
        while let pVC = presentViewController?.presentedViewController {
            presentViewController = pVC
        }
        
        return presentViewController
    }
    
}
