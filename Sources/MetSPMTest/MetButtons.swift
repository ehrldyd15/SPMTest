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
        private var handler: () -> ()
        
        public var text: String = ""
        
        public init(text: String, handler: @escaping () -> ()) {
            self.text = text
            self.handler = handler
        }
        
        public var body: some View {
            Button() {
                print("버튼 눌렀다")
                handler()
            } label: {
                Text(text)
            }
        }
        
    }
    
}
