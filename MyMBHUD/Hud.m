//
//  Hud.m
//  MyMBHUD
//
//  Created by SethYin on 2017/1/2.
//  Copyright © 2017年 yanhuihui. All rights reserved.
//

#import "Hud.h"

@interface Hud ()<UITextFieldDelegate>

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UIButton *Btn;
@property (nonatomic, strong) UIButton *Btn2;
@property (nonatomic, strong) UIButton *Btn3;
@property (nonatomic, strong) UITextField *text;
@end

@implementation Hud

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.contentView = [[UIView alloc]initWithFrame:CGRectMake(120,100, 130, 120)];
        self.contentView.backgroundColor  = [UIColor whiteColor];
        self.contentView.alpha = 1;
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 130, 30)];
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont systemFontOfSize:13];
        _label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label];
        
        _label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 130, 40)];
        _label2.numberOfLines = 0;
        _label2.textColor = [UIColor blackColor];
        _label2.font = [UIFont systemFontOfSize:11];
        _label2.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label2];
        
       [self addSubview:self.contentView];
    }
    return self;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_text resignFirstResponder];
    return YES;
}
-(void)BuildSuccessUI:(ShowType)type{
    self.contentView.frame = CGRectMake(120, 200, 130, 180);
    _Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _Btn.frame = CGRectMake(10, 90, 110, 20);
    _Btn.backgroundColor = [UIColor greenColor];
    _Btn.tag = 1001;
    [_Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_Btn addTarget:self action:@selector(DoneCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_Btn];
    
    if  (type == Info)
    {
        _Btn.hidden = YES;
        _text= [[UITextField alloc]initWithFrame:CGRectMake(10, 90, 110, 20)];
        _text.placeholder = @"Enter your name";
        _text.font = [UIFont systemFontOfSize:12];
        _text.layer.borderWidth = 1;
        _text.layer.borderColor = [UIColor purpleColor].CGColor;
        [self.contentView addSubview:_text];
    }
    
    _Btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _Btn2.frame = CGRectMake(10, 120, 110, 20);
    _Btn2.backgroundColor = [UIColor greenColor];
    _Btn2.tag = 1002;
    [_Btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_Btn2 addTarget:self action:@selector(DoneCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_Btn2];
    
    _Btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    _Btn3.frame = CGRectMake(10, 150, 110, 20);
    _Btn3.backgroundColor = [UIColor greenColor];
    _Btn3.tag = 1003;
    [_Btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_Btn3 addTarget:self action:@selector(DoneCLicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_Btn3];
    
}

+(instancetype)showHud{
    return [self showAnimation:Fade];
}
-(void)DoneCLicked:(UIButton*)sender{
    self.alpha = 0;
    [_text resignFirstResponder];
    switch (sender.tag) {
        case 1001:
            NSLog(@"111111111111111");
            break;
        case 1002:
            NSLog(@"222222222222222");
            break;
        case 1003:
            NSLog(@"33333333333333");
            
            break;
        default:
            break;
    }
   
}
+(instancetype)showSuccessHudWithTitle: (NSString *) title
                detailMessage: (NSString *) detail
                clickedFirstBtnTitle: (NSString *) clickedFirstBtnTitle
                clickedSecondBtnTitle: (NSString *) clickedSecondBtnTitle
                clickedDoneBtnTitle: (NSString *) clickedDoneBtnTitle
                showType:(ShowType)showType
{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    Hud *hud = [[Hud alloc]initWithFrame:window.bounds];
    [hud BuildSuccessUI:showType];
    [window addSubview:hud];
    
    hud.label.text = title;
    hud.label2.text = detail;
    if(showType == Success){
        [hud.Btn setTitle:clickedFirstBtnTitle forState:UIControlStateNormal];
        [hud.Btn2 setTitle:clickedSecondBtnTitle forState:UIControlStateNormal];
        [hud.Btn3 setTitle:clickedDoneBtnTitle forState:UIControlStateNormal];
    }else if (showType == Info){
        hud.Btn.hidden =YES;
     
        [hud.Btn2 setTitle:clickedSecondBtnTitle forState:UIControlStateNormal];
        [hud.Btn3 setTitle:clickedDoneBtnTitle forState:UIControlStateNormal];
        [hud showAnimaion:Fade];
    }else if (showType == Cusetom){
        hud.contentView.frame = CGRectMake(120, 200, 130, 120);
        hud.Btn.backgroundColor = [UIColor purpleColor];
        [hud.Btn setTitle:clickedFirstBtnTitle forState:UIControlStateNormal];
        hud.Btn2.hidden = YES;
        hud.Btn3.hidden = YES;
        [hud showAnimaion:Fade];
    }else if (showType == Notice){
        hud.contentView.frame = CGRectMake(120, 200, 130, 120);
        hud.Btn.backgroundColor = [UIColor lightGrayColor];
        [hud.Btn setTitle:clickedFirstBtnTitle forState:UIControlStateNormal];
        hud.Btn2.hidden = YES;
        hud.Btn3.hidden = YES;
        [hud showAnimaion:Fade];
    }else if (showType == Waiting){
        hud.contentView.frame = CGRectMake(120, 200, 130, 100);
        hud.Btn.hidden = YES;
        hud.Btn2.hidden = YES;
        hud.Btn3.hidden = YES;
        [hud showAnimaion:Dismiss];
    }else if (showType == Timer){
        hud.contentView.frame = CGRectMake(120, 200, 130, 120);
        hud.Btn.backgroundColor = [UIColor blueColor];
        [hud.Btn setTitle:clickedFirstBtnTitle forState:UIControlStateNormal];
        hud.Btn2.hidden = YES;
        hud.Btn3.hidden = YES;
        [hud showAnimaion:Fade];
    }else if (showType == Question){
        hud.contentView.frame = CGRectMake(120, 200, 130, 120);
        hud.Btn.backgroundColor = [UIColor lightGrayColor];
        [hud.Btn setTitle:clickedFirstBtnTitle forState:UIControlStateNormal];
        hud.Btn2.hidden = YES;
        hud.Btn3.hidden = YES;
        [hud showAnimaion:Fade];
    }

  
    
    
    
    return hud;
}

+(instancetype)showAnimation:(AnimationType)type{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    Hud *hud = [[Hud alloc]initWithFrame:window.bounds];
    [window addSubview:hud];
    [hud showAnimaion:type];
    return hud;
}

-(void)showAnimaion:(AnimationType)type{
    if (type == Fade) {
//        [UIView animateWithDuration:2.5 animations:^{
//            self.alpha = 0.75;
//            CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"rotation"];
//            ani.toValue = [NSValue valueWithCGPoint:CGPointMake(120, 100)];
//            ani.fillMode = kCAFillModeForwards;
//            ani.removedOnCompletion = NO;
//            ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//            [self.contentView.layer addAnimation:ani forKey:@"PostionAni"];
//        }];
        self.contentView.alpha = 1;
        self.alpha = 0.95;
//        CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"translation"];
//        ani.toValue = [NSValue valueWithCGPoint:CGPointMake(120, 100)];
//        ani.fillMode = kCAFillModeForwards;
//        ani.removedOnCompletion = NO;
//        ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//        [self.contentView.layer addAnimation:ani forKey:@"PostionAni"];
        
//        CAKeyframeAnimation * ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//        ani.duration = 1.0;
//        ani.removedOnCompletion = NO;
//        ani.fillMode = kCAFillModeForwards;
//        ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        NSValue * value1 = [NSValue valueWithCGPoint:CGPointMake(150, 200)];
//        NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(250, 200)];
//        NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(250, 300)];
//        NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(150, 300)];
//        NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(150, 200)];
//        ani.values = @[value1, value2, value3, value4, value5];
//        [self.contentView.layer addAnimation:ani forKey:@"PostionKeyframeValueAni"];
        
    }else if(type == Scale){
        self.contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
        [UIView animateWithDuration:2.5 animations:^{
            self.contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5, 1.5);
        }completion:^(BOOL finished) {
           [UIView animateWithDuration:2.5 animations:^{
               self.contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
           }];
        }];
    }else if (type == Dismiss) {
        self.contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
        [UIView animateWithDuration:2.5 animations:^{
            self.contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5, 1.5);
        }completion:^(BOOL finished) {
            self.alpha = 0;
        }];

    }
}


@end
