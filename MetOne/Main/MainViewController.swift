//
//  MainViewController.swift
//  MetOne
//
//  Created by Do Kiyong on 11/1/23.
//

import UIKit
import NFilterFeature

protocol MainViewControllerDelegate {
    func moveSubView()
}

class MainViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello main view controller")

    }
    
    @IBAction func moveSubView(_ sender: Any) {
//        self.delegate?.moveSubView()
        
//        guard let body = message.body as? [String: Any] else { return }
//        
//        let param = Utils.dictionaryToObject(objectType: NFilterParamModel.self, dictionary: body)
//        
//        NFilterView.shared.showTextKeypad(param: param)
//        NFilterView.shared.completion = { (dic) in
//            self.callJavaScriptFunction(callBackDic: dic, callBackId: param?.callBackId ?? UIConstant.empty)
//        }
//        
//        var message = {
//        nFilterPubKey: "MDIwGhMABBYCBEsAMWHtqFKFE9xK+8OWdHVjeXSQBBTlmbbw1STxAJoZXHDu2Uyj8drXTg==",
//        nFilterFullMode: false,
//        nFilterLength: 7,
//        nFilterIsSerial: false,
//        callBackId: "callbackTextKeyboard"
//        };
        
    }
    
}
