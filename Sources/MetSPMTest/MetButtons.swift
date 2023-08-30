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
    public struct BottomButton: View {
        private var handler: () -> ()
        
        public var text: String = ""
        
        public init(text: String, handler: @escaping () -> ()) {
            self.text = text
            self.handler = handler
        }
        
        public var body: some View {
            VStack {
                Button() {
                    print("버튼 눌렀다")
                    handler()
                } label: {
                    Text(text)
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(.red)

                Image("BG", bundle: Bundle.module2)
                    .frame(width: 200, height: 300)
            }
        }
        
    }
    
}

import class Foundation.Bundle

private class BundleFinder {}

extension Foundation.Bundle {

    static var module2: Bundle = {
        let bundleName = "MetSPMTest_MetSPMTest"

        let candidates = [
            Bundle.main.resourceURL,

            Bundle(for: BundleFinder.self).resourceURL,

            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        
        fatalError("unable to find bundle named BioSwift_BioSwift")
    }()
    
}
