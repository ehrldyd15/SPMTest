//
//  ClockModel.swift
//  MetOneSampleApp
//
//  Created by Do Kiyong on 11/30/23.
//

import Foundation

class Clock {
    
    static var currentTime: (() -> String) = {
        let today = Date()
        
        let hours = Calendar.current.component(.hour, from: today)
        let minutes = Calendar.current.component(.minute, from: today)
        let minStr = String(format: "%02d", minutes)
        let seconds = Calendar.current.component(.second, from: today)
        let secStr = String(format: "%02d", seconds)
        
        return "\(hours):\(minStr):\(secStr)"
    }
    
}
