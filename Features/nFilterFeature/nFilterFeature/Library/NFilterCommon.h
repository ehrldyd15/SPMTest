//
//  NFilterCommon.h
//  nFileterForiPhone
//
//  Created by 김기원 on 2016. 2. 16..
//
//
#import <UIKit/UIKit.h>

@import Foundation;

#define NF_versionInfo @"nFilter iOS 6.0.8"

typedef NS_ENUM (NSInteger, NFilterMasking)
{
    NFilterMaskingDefault,
    NFilterMaskingAll,
    NFilterMaskingNon
};

typedef NS_ENUM (NSInteger, NFilterAttachType)
{
    NFilterAttachView,
    NFilterAttachViewController
};

typedef NS_ENUM (NSInteger, NFilterAESMode)
{
    NFilterAESModeCBC,
    NFilterAESModeECB
};

typedef NS_ENUM (NSInteger, NFilterCharInputType)
{
    NFilterKeypadTypeNon    = 1000,     // 예외처리용
    NFilterKeypadTypeL      = 1001,     // 소문자
    NFilterKeypadTypeU      = 2001,     // 대문자
    NFilterKeypadTypeS      = 3001,     // 특수문자
    NFilterKeypadTypeN      = 4001,     // 숫자
    NFilterKeypadTypeSpace  = 5001,     // 스페이스
    NFilterKeypadTypeDelete = 5002      // 삭제
};

@interface NFilterCommon : NSObject
{
    
}

+ (void)soundPlay:(NSString*)pSoundFile;
+ (BOOL)isIPhoneX;
@end
