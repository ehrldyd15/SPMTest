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
    
    @available(macOS 12.0, *)
    @available(iOS 15.0, *)
    public struct BottomButton: View {
        private var handler: () -> ()
        
        public var text: String = ""
        
        public init(text: String, handler: @escaping () -> ()) {
            self.text = text
            self.handler = handler
        }
        
        public var body: some View {
            VStack {
                Button(text) {
                    print("버튼 눌렀다")
                    handler()
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(.red)

                Image("BG", bundle: Bundle.module)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
            }
        }
        
    }
    
}
