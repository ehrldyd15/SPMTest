//
//  MetButtons.swift
//  
//
//  Created by Do Kiyong on 2023/08/29.
//

import SwiftUI

extension MetSPMTest {
    
    public struct MetButtons {
        
        public init() {}
        
    }
    
}

extension MetSPMTest.MetButtons {
    
    public struct BottomButton: View {
        
        public var text: String = ""
        
        public init() {
//            self.text = text
        }
        
        public var body: some View {
            Button() {
                print("버튼 눌렀다")
            } label: {
                Text(text)
            }
        }
        
    }
    
}
