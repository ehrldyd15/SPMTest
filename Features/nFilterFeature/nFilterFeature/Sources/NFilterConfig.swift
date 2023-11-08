//
//  NFilterConfig.swift
//  nFilterFeature
//
//  Created by Do Kiyong on 11/8/23.
//

import Foundation

class NFilterConfig {
    
    static let shared = NFilterConfig()
    
    private init() {}
    
    var charNibName: String {
        return "NFilterChar"
    }
    
    var charTagName: String {
        return "encdata2"
    }
    
    var numNibName: String {
        return "NFilterNum"
    }
    
    var numTagName: String {
        return "encdata1"
    }
    
    var buttonTitleCancel: String {
        return "취소"
    }
    
    var buttonTitleConfirm: String {
        return "확인"
    }
    
    var buttonTitleRearrangement: String {
        return "재배열"
    }
    
    var buttonTitleDelete: String {
        return "삭제"
    }
    
    var textPadTopTitle: String {
        return "보안문자키패드"
    }
    
    var textPadTitle: String {
        return "문자를 입력하세요."
    }
    
    var numberPadTopTitle: String {
        return "보안숫자키패드"
    }
    
    var numberPadTitle: String {
        return "숫자를 입력하세요."
    }
    
}


