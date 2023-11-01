//
//  MetBundle.swift
//  MetFoundation
//
//  Created by Do Kiyong on 10/27/23.
//

import Foundation

extension Bundle {
    
    public static func moduleBundle(for object: AnyObject) -> Bundle! {
        Bundle.moduleBundle(forObject: object)
    }

    public static func moduleBundle(forObject: AnyObject) -> Bundle {
        Bundle(for: type(of: forObject))
    }
    
}
