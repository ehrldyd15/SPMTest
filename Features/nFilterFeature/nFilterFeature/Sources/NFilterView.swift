//
//  NFilterView.swift
//  nFilterFeature
//
//  Created by Do Kiyong on 11/8/23.
//

import UIKit
import MetFoundation

class NFilterView: NSObject {
    
    static let shared = NFilterView()
    
    let nFilterConfig = NFilterConfig.shared
    
    let topView = UIApplication.getPresentedViewController()
    
    var numPad: NFilterNum?
    var charPad: NFilterChar?
    
    var callBackId: String?
    
    var completion: (([String : String]) -> Void)? = nil
    
    //MARK: - NFilter 문자 반 키패드 (View 모드) 생성
    func showTextKeypad(param: NFilterParamModel?) {
        guard let param = param else { return }
        
        callBackId = param.callBackId
        
        if numPad != nil {
            numPad?.view.removeFromSuperview()
            numPad = nil
        }
        
        if charPad != nil {
            charPad?.view.removeFromSuperview()
            charPad = nil
        }
        
        charPad = NFilterChar(nibName: nFilterConfig.charNibName, bundle: nil)
        charPad?.useInitialVector = true
        charPad?.setTitleText(nFilterConfig.textPadTitle)
        charPad?.setTopBarText(nFilterConfig.textPadTopTitle)
        charPad?.setServerPublickey(param.nFilterPubKey)
//        log.d("showTextKeypad publickey : %@", param.nFilterPubKey ?? UIConstant.empty)
        
        charPad?.setCallbackMethod(self, methodOnConfirm: #selector(onConfirmNFilter(_:encText:dummyText:tagName:)), methodOnPrev: #selector(onPrevNFilter(_:encText:dummyText:tagName:)), methodOnNext: #selector(onNextNFilter(_:encText:dummyText:tagName:)), methodOnPress: #selector(onPressNFilter(_:encText:dummyText:tagName:)), methodOnReArrange: #selector(onReArrangeNFilter))
        
        charPad?.setCloseCallbackMethod(self, methodOnClose: #selector(onCloseNFilter(_:encText:dummyText:tagName:)))
        
        charPad?.setLengthWithTagName(nFilterConfig.charTagName, length:param.nFilterLength ?? 0)
        charPad?.setFullMode(param.nFilterFullMode ?? true)
        charPad?.setNoPadding(false)
        charPad?.setSupportBackgroundEvent(false)
        charPad?.setSupportBackGroundClose(true)
        charPad?.masking = NFilterMasking.default
        charPad?.attachType = NFilterAttachType.viewController
        charPad?.showHanguleText = true
        charPad?.nFilterHeight = 250
        charPad?.setDeepSecMode(false)
        charPad?.useVoiceOverViaSpreaker = true
        charPad?.setNoSound(true)
        charPad?.bottomMaginForIPhoneX = 40
        charPad?.maginForIPhoneX = 40
        
        if param.nFilterFullMode == false {
            charPad!.toolbar2 = createNFilterToolbarForChar()
            charPad?.toolbar2.delegate = self
        }
        
        // 아이패드인 경우
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            charPad?.showKeypadBubble = false
        }
        
        if #available(iOS 13.0, *) {
            charPad?.showKeypad((UIApplication.shared.windows.first?.windowScene!.interfaceOrientation)!,
                                parentViewController: topView)
        } else {
            // Fallback on earlier versions
        }
    }
    
    //MARK: - NFilter 숮자 반 키패드 (View 모드) 생성
    func showNumKeypad(param: NFilterParamModel?) {
        guard let param = param else { return }
        
        callBackId = param.callBackId
        
        if numPad != nil {
            numPad?.view.removeFromSuperview()
            numPad = nil
        }
        
        if charPad != nil {
            charPad?.view.removeFromSuperview()
            charPad = nil
        }
        
        // NFilter 숫자 키패드 생성
        numPad = NFilterNum(nibName: nFilterConfig.numNibName, bundle: nil) // 일반넘패드
        numPad?.useInitialVector = true
        numPad?.setTitleText(nFilterConfig.numberPadTitle)
        numPad?.setTopBarText(nFilterConfig.numberPadTopTitle)
        numPad?.setServerPublickey(param.nFilterPubKey)
//        log.d("showNumKeypad publickey : %@", param.nFilterPubKey ?? UIConstant.empty)
        
        numPad?.setCallbackMethod(
            self,
            methodOnConfirm: #selector(onConfirmNFilter(_:encText:dummyText:tagName:)),
            methodOnPrev: #selector(onPrevNFilter(_:encText:dummyText:tagName:)),
            methodOnNext: #selector(onNextNFilter(_:encText:dummyText:tagName:)),
            methodOnPress: #selector(onPressNFilter(_:encText:dummyText:tagName:)),
            methodOnReArrange: #selector(onReArrangeNFilter))
        numPad?.setCloseCallbackMethod(self, methodOnClose: #selector(onCloseNFilter(_:encText:dummyText:tagName:)))
        
        numPad?.setLengthWithTagName(nFilterConfig.numTagName, length:param.nFilterLength ?? 0)
        numPad?.setFullMode(param.nFilterFullMode ?? true)
        numPad?.setSupportBackgroundEvent(false)
        numPad?.setSupportBackGroundClose(true)
        numPad?.isSerialMode = param.nFilterIsSerial ?? true
        numPad?.keyPadBackground = .lightGray
        numPad?.useVoiceOverViaSpreaker = true
        numPad?.bezelLengthOfKeyPad = 10
        numPad?.setNoSound(true)
        numPad?.bottomMaginForIPhoneX = 40
        numPad?.maginForIPhoneX = 40
        
        if param.nFilterFullMode == false {
            if param.nFilterIsSerial == true {
                numPad!.toolbar2 = createNFilterToolbarForNumSerial()
            } else {
                numPad!.toolbar2 = createNFilterToolbarForNumRandom()
            }
            
            numPad?.toolbar2.delegate = self
        }
        
        if #available(iOS 13.0, *) {
            numPad?.showKeypad((UIApplication.shared.windows.first?.windowScene!.interfaceOrientation)!,
                               parentViewController: topView)
        } else {
            // Fallback on earlier versions
        }
    }
    
}

extension NFilterView {
    //MARK: - NFilter 키패드 문자열 툴바
    func createNFilterToolbarForChar() -> NFilterToolbar2 {
        let toolbar = NFilterToolbar2(frame: CGRect(x: 0,
                                                    y: 100,
                                                    width: self.topView?.view.frame.size.width ?? 0,
                                                    height: 44))
        toolbar.backgroundColor = UIImage.UIColorFromRGB(rgbValue: 0xebebeb)
        
        var toolbarButton = NFilterButton2(frame: CGRect(x: 0, y: 0, width: 80, height: 42))
        var btn = toolbarButton?.button
        
        // 취소
        toolbarButton = NFilterButton2(frame: CGRect(x: 0, y: 0, width: 80, height: 42))
        btn = toolbarButton?.button
        btn?.setTitle(nFilterConfig.buttonTitleCancel, for: .normal)
        btn?.setTitleColor(UIColor.gray, for: .normal)
        btn?.setBackgroundImage(UIImage.from(color: UIColor.metWhite), for: .normal)
        toolbarButton?.nFilterbuttonType = NFilterButtonType.cancel
        toolbarButton?.alignWithMargins = true
        toolbarButton?.margins = NFMarginsMake(4, 4, 0, 4)
        toolbarButton?.dock = NFDockTypeLeft
        
        toolbar.addButton(toolbarButton)
        
        // 확인
        toolbarButton = NFilterButton2(frame: CGRect(x: 0, y: 0, width: 80, height: 42))
        btn = toolbarButton?.button
        btn?.setTitle(nFilterConfig.buttonTitleConfirm, for: .normal)
        btn?.setTitleColor(UIColor.gray, for: .normal)
        btn?.setBackgroundImage(UIImage.from(color: UIColor.orange), for: .normal)
        toolbarButton?.nFilterbuttonType = NFilterButtonType.OK
        toolbarButton?.alignWithMargins = true
        toolbarButton?.margins = NFMarginsMake(4, 4, 4, 4)
        toolbarButton?.dock = NFDockTypeRight
        
        toolbar.addButton(toolbarButton)
        
        toolbar.align = NFilterToolbarAlign.top
        
        return toolbar
    }
    
    //MARK: - NFilter 키패드 랜덤숫자 툴바
    func createNFilterToolbarForNumRandom () -> NFilterToolbar2 {
        let toolbar = NFilterToolbar2(frame: CGRect(x: 0,
                                                    y: 100,
                                                    width: self.topView?.view.frame.size.width ?? 0,
                                                    height: 44))
        toolbar.backgroundColor = UIImage.UIColorFromRGB(rgbValue: 0xebebeb)
        
        var toolbarButton = NFilterButton2(frame: CGRect(x: 0, y: 0, width:80, height: 42))
        var btn = toolbarButton?.button
        
        // 취소
        toolbarButton = NFilterButton2(frame: CGRect(x: 0, y: 0, width:80, height: 42))
        btn = toolbarButton?.button
        btn?.setTitle(nFilterConfig.buttonTitleCancel, for: .normal)
        btn?.setTitleColor(UIColor.gray, for: .normal)
        btn?.setBackgroundImage(UIImage.from(color: UIColor.metWhite), for: .normal)
        toolbarButton?.nFilterbuttonType = NFilterButtonType.cancel
        toolbarButton?.alignWithMargins = true
        toolbarButton?.margins = NFMarginsMake(4, 4, 0, 4)
        toolbarButton?.dock = NFDockTypeLeft
        
        toolbar.addButton(toolbarButton)
        
        // 확인
        toolbarButton = NFilterButton2(frame: CGRect(x: 0, y: 0, width:80, height: 42))
        btn = toolbarButton?.button
        btn?.setTitle(nFilterConfig.buttonTitleConfirm, for: .normal)
        btn?.setTitleColor(UIColor.gray, for: .normal)
        btn?.setBackgroundImage(UIImage.from(color: UIColor.orange), for: .normal)
        toolbarButton?.nFilterbuttonType = NFilterButtonType.OK
        toolbarButton?.alignWithMargins = true
        toolbarButton?.margins = NFMarginsMake(4, 4, 4, 4)
        toolbarButton?.dock = NFDockTypeRight
        
        toolbar.addButton(toolbarButton)
        
        toolbar.align = NFilterToolbarAlign.top
        
        return toolbar
    }
    
    //MARK: - NFilter 키패드 시리얼 숫자 툴바
    func createNFilterToolbarForNumSerial () -> NFilterToolbar2 {
        let toolbar = NFilterToolbar2(frame: CGRect(x: 0,
                                                    y: 100,
                                                    width: self.topView?.view.frame.size.width ?? 0,
                                                    height: 56))
        toolbar.backgroundColor = UIImage.UIColorFromRGB(rgbValue: 0xebebeb)
        
        // 재배열
        var toolbarButton = NFilterButton2(frame: CGRect(x: 0, y: 0, width:80, height: 42))
        var btn = toolbarButton?.button
        btn?.setTitle(nFilterConfig.buttonTitleRearrangement, for: .normal)
        btn?.setTitleColor(UIColor.gray, for: .normal)
        btn?.setBackgroundImage(UIImage.from(color: UIColor.metWhite), for: .normal)
        toolbarButton?.nFilterbuttonType = NFilterButtonType.replace
        toolbarButton?.alignWithMargins = true
        toolbarButton?.margins = NFMarginsMake(7, 7, 0, 7)
        toolbarButton?.dock = NFDockTypeLeft
        
        toolbar.addButton(toolbarButton)
        
        // 취소
        toolbarButton = NFilterButton2(frame: CGRect(x: 0, y: 0, width:80, height: 42))
        btn = toolbarButton?.button
        btn?.setTitle(nFilterConfig.buttonTitleCancel, for: .normal)
        btn?.setTitleColor(UIColor.gray, for: .normal)
        btn?.setBackgroundImage(UIImage.from(color: UIColor.metWhite), for: .normal)
        toolbarButton?.nFilterbuttonType = NFilterButtonType.cancel
        toolbarButton?.alignWithMargins = true
        toolbarButton?.margins = NFMarginsMake(7, 7, 0, 7)
        toolbarButton?.dock = NFDockTypeLeft
        
        toolbar.addButton(toolbarButton)
        
        // 확인
        toolbarButton = NFilterButton2(frame: CGRect(x: 0, y: 0, width:80, height: 42))
        btn = toolbarButton?.button
        btn?.setTitle(nFilterConfig.buttonTitleConfirm, for: .normal)
        btn?.setTitleColor(UIColor.gray, for: .normal)
        btn?.setBackgroundImage(UIImage.from(color: UIColor.orange), for: .normal)
        toolbarButton?.nFilterbuttonType = NFilterButtonType.OK
        toolbarButton?.alignWithMargins = true
        toolbarButton?.margins = NFMarginsMake(7, 7, 7, 7)
        toolbarButton?.dock = NFDockTypeRight
        
        toolbar.addButton(toolbarButton)
        
        toolbar.align = NFilterToolbarAlign.bottom
        
        return toolbar
    }
    
}



