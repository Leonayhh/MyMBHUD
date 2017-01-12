//
//  Hud.h
//  MyMBHUD
//
//  Created by SethYin on 2017/1/2.
//  Copyright © 2017年 yanhuihui. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,AnimationType) {
    Fade = 0,
    Scale = 1,
    Dismiss
};
typedef NS_ENUM(NSInteger,ShowType) {
    Success = 0,
    Info = 1,
    Cusetom = 2,
    Notice = 3,
    Waiting = 4,
    Timer = 5,
    Question = 6
};
@interface Hud : UIView

+(instancetype)showHud;

//+(instancetype)showHudWithTitle: (NSString *)title;


+(instancetype)showSuccessHudWithTitle: (NSString *) title
                         detailMessage: (NSString *) detail
                  clickedFirstBtnTitle: (NSString *) clickedFirstBtnTitle
                 clickedSecondBtnTitle: (NSString *) clickedSecondBtnTitle
                   clickedDoneBtnTitle: (NSString *) clickedDoneBtnTitle
                              showType: (ShowType  ) showType;

+(instancetype)showAnimation:(AnimationType)type;


-(void)BuildSuccessUI:(ShowType)type;
//-(instancetype)iniwWithSuccess;






@end
