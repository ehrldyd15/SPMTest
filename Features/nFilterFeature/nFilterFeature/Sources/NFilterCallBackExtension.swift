//
//  NFilterCallBackExtension.swift
//  nFilterFeature
//
//  Created by Do Kiyong on 11/8/23.
//

import Foundation

extension NFilterView: NFilterCharDelegate, NFilterNumDelegate, NFilterToolbar2Delegate {
    // MARK: - NFilter 키패드 callback 함수
    @objc func onReArrangeNFilter() {

    }
    
    /*--------------------------------------------------------------------------------------
     엔필터 '이전' 버튼 눌렀을 때 발생하는 콜백함수
     ---------------------------------------------------------------------------------------*/
    @objc func onPrevNFilter(_ secureText: String?, encText: String?, dummyText: String?, tagName: String?) {
//        log.d("이전버튼 눌림")
//        log.d("태그: %@", tagName ?? "")
//        log.d("암호문: %@", secureText ?? "")
//        log.d("더미: %@", dummyText ?? "")
//        log.d("서버에 보낼 암호문: %@", encText ?? "")
    }
    
    /*--------------------------------------------------------------------------------------
     엔필터 '다음' 버튼 눌렀을 때 발생하는 콜백함수
     ---------------------------------------------------------------------------------------*/
    @objc func onNextNFilter(_ secureText: String?, encText: String?, dummyText: String?, tagName: String?) {
//        log.d("다음버튼 눌림")
//        log.d("태그: %@", tagName ?? "")
//        log.d("암호문: %@", secureText ?? "")
//        log.d("더미: %@", dummyText ?? "")
//        log.d("서버에 보낼 암호문: %@", encText ?? "")
    }
    
    /*--------------------------------------------------------------------------------------
     엔필터 '키' 버튼 눌렀을 때 발생하는 콜백함수
     ---------------------------------------------------------------------------------------*/
    @objc func onPressNFilter(_ secureText: String?, encText: String?, dummyText: String?, tagName: String?) {
//        log.d("엔필터 키눌림")
//        log.d("태그: %@", tagName ?? "")
//        log.d("암호문: %@", secureText ?? "")
//        log.d("더미: %@", dummyText ?? "")
//        log.d("서버에 보낼 암호문: %@", encText ?? "")
    }
    
    /*--------------------------------------------------------------------------------------
     엔필터 '확인' 버튼 눌렀을 때 발생하는 콜백함수
     ---------------------------------------------------------------------------------------*/
    @objc func onConfirmNFilter(_ secureText: String?, encText: String?, dummyText: String?, tagName: String?) {
        var callBackDic: [String: String] = [:]
        
        callBackDic["tagName"] = tagName
        callBackDic["secureText"] = secureText
        callBackDic["dummyText"] = dummyText
        callBackDic["encText"] = encText
        callBackDic["resultCode"] = "0"
        
//        log.d("callBackDic: \(callBackDic)")
        
        if let completion = self.completion {
            completion(callBackDic)
        }
        
        numPad?.closeKeypad()
        charPad?.closeKeypad()
    }
    
    /*--------------------------------------------------------------------------------------
     엔필터 '취소' 버튼 눌렀을 때 발생하는 콜백함수
     ---------------------------------------------------------------------------------------*/
    @objc func onCancelNFilter(_ secureText: String?, encText: String?, dummyText: String?, tagName: String?) {
//        log.d("취소버튼 눌림")
//        log.d("태그: %@", tagName ?? "")
//        log.d("암호문: %@", secureText ?? "")
//        log.d("더미: %@", dummyText ?? "")
//        log.d("서버에 보낼 암호문: %@", encText ?? "")
    }
    
    /*--------------------------------------------------------------------------------------
     엔필터 '취소' 버튼 눌렀을 때 발생하는 콜백함수
     ---------------------------------------------------------------------------------------*/
    @objc func onCancel() {
//        log.d("엔필터 닫힘")
    }
    
    /*--------------------------------------------------------------------------------------
     엔필터 'Background Close'동작할때 발생하는 콜백 함수
     ---------------------------------------------------------------------------------------*/
    @objc func onCloseNFilter(_ secureText: String?, encText: String?, dummyText: String?, tagName: String?) {
//        log.d("닫힘 눌림")
//        log.d("태그: %@", tagName ?? "")
//        log.d("암호문: %@", secureText ?? "")
//        log.d("더미: %@", dummyText ?? "")
//        log.d("서버에 보낼 암호문: %@", encText ?? "")
    }
    
    @objc func nFilterToolbarButtonClick(_ buttonType: NFilterButtonType, with button: UIButton!) {
        if numPad != nil {
            switch buttonType {
            case NFilterButtonType.OK:
                numPad?.pressConfirm()
                break
            case NFilterButtonType.cancel:
                numPad?.pressCancel()
                break
            case NFilterButtonType.replace:
                numPad?.pressKeypadReload()
                break
            case NFilterButtonType.delete:
                numPad?.pressBack()
                break
            case NFilterButtonType.next:
                print("다음 작업 처리를 하세요.")
                break
            case NFilterButtonType.prev:
                print("이전 작업 처리를 하세요.")
                break
            default:
                break
            }
        } else if charPad != nil {
            switch buttonType {
            case NFilterButtonType.OK:
                charPad?.pressConfirm()
                break
            case NFilterButtonType.cancel:
                charPad?.pressCancel()
                break
            case NFilterButtonType.replace:
                charPad?.pressKeypadReload()
                break
            case NFilterButtonType.delete:
                charPad?.pressBack()
                break
            case NFilterButtonType.next:
                print("다음 작업 처리를 하세요.")
                break
            case NFilterButtonType.prev:
                print("이전 작업 처리를 하세요.")
                break
            default:
                break
            }
        }
    }
    
}



