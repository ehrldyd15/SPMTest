//
//  SubViewControllerViewModel.swift
//  MetOneSampleApp
//
//  Created by Do Kiyong on 11/30/23.
//

import Combine
import Foundation

class SubViewControllerViewModel {
    
    @Published var dj: [DJ] = []
    
    init() {
        dj = [DJ(name: "DKY"),
              DJ(name: "DKY2"),
              DJ(name: "DKY3"),
              DJ(name: "DKY4"),
              DJ(name: "DKY5"),
              DJ(name: "DKY6"),
              DJ(name: "DKY7"),
              DJ(name: "DKY8"),
              DJ(name: "DKY9"),
              DJ(name: "DKY10"),
        ]
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.dj = [DJ(name: "A"),
                       DJ(name: "A"),
                       DJ(name: "C"),
                       DJ(name: "C"),
                       DJ(name: "C"),
                       DJ(name: "E"),
                       DJ(name: "E"),
                       DJ(name: "E"),
                       DJ(name: "I"),
                       DJ(name: "J"),
            ]
        }
    }
    
}
