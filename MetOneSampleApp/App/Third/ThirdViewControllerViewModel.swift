//
//  ThirdViewControllerViewModel.swift
//  MetOneSampleApp
//
//  Created by Do Kiyong on 11/30/23.
//

import Foundation
import Combine

class ThirdViewControllerViewModel {
    
    @Published var combineTime: String = "Combine"
    
    var didChangeTime: ((ThirdViewControllerViewModel) -> Void)?
    var observableTime: Observable<String> = Observable("Observable")
    
    var closureTime: String {
        didSet {
            didChangeTime?(self)
        }
    }
    
    init() {
        closureTime = Clock.currentTime()
        observableTime.value = Clock.currentTime()
    }
    
    func checkTime() {
        combineTime = Clock.currentTime()
        closureTime = Clock.currentTime()
        observableTime.value = Clock.currentTime()
    }
    
}
