//
//  NFilterModel.swift
//  NFilterFeature
//
//  Created by Do Kiyong on 11/8/23.
//

import UIKit
import Foundation

typealias NFilterParamModel = NFilterParam.ParamResponse.Param

enum NFilterParam {
    
    enum ParamResponse {
        
        struct Param: Codable {
            var nFilterPubKey: String?
            var nFilterFullMode: Bool?
            var nFilterLength: Int?
            var nFilterIsSerial: Bool?
            var callBackId: String?
        }
        
    }
    
}
