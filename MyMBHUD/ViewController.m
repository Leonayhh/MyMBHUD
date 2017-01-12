//
//  ViewController.m
//  MyMBHUD
//
//  Created by SethYin on 2017/1/2.
//  Copyright © 2017年 yanhuihui. All rights reserved.
//

#import "ViewController.h"
#import "Hud.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *Success;
@property (weak, nonatomic) IBOutlet UIButton *Info;
@property (weak, nonatomic) IBOutlet UIButton *Custom;
@property (weak, nonatomic) IBOutlet UIButton *Notice;
@property (weak, nonatomic) IBOutlet UIButton *Waiting;
@property (weak, nonatomic) IBOutlet UIButton *Timer;
@property (weak, nonatomic) IBOutlet UIButton *Question;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.Success addTarget:self action:@selector(hudAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.Info addTarget:self action:@selector(hudAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.Custom addTarget:self action:@selector(hudAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.Notice addTarget:self action:@selector(hudAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.Waiting addTarget:self action:@selector(hudAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.Timer addTarget:self action:@selector(hudAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.Question addTarget:self action:@selector(hudAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)hudAction:(UIButton*)sender{
    switch (sender.tag) {
        case 2001:
             [Hud showSuccessHudWithTitle:@"Congratulations" detailMessage:@"You've just displated this awesome Pop Up View" clickedFirstBtnTitle:@"First" clickedSecondBtnTitle:@"Second" clickedDoneBtnTitle:@"Done" showType:Success];
            break;
        case 2002:
             [Hud showSuccessHudWithTitle:@"Info" detailMessage:@"You've just displated this awesome Pop Up View" clickedFirstBtnTitle:@"" clickedSecondBtnTitle:@"Show Name" clickedDoneBtnTitle:@"Done" showType:Info];
            break;
        case 2003:
             [Hud showSuccessHudWithTitle:@"Custom" detailMessage:@"You've just displated this awesome Pop Up View" clickedFirstBtnTitle:@"OK" clickedSecondBtnTitle:@"" clickedDoneBtnTitle:@"" showType:Cusetom];
            break;
        case 2004:
             [Hud showSuccessHudWithTitle:@"Notice" detailMessage:@"You've just displated this awesome Pop Up View" clickedFirstBtnTitle:@"Done" clickedSecondBtnTitle:@"" clickedDoneBtnTitle:@"" showType:Notice];
            break;
        case 2005:
             [Hud showSuccessHudWithTitle:@"Waiting......" detailMessage:@"You've just displated this awesome Pop Up View" clickedFirstBtnTitle:@"" clickedSecondBtnTitle:@"" clickedDoneBtnTitle:@"" showType:Waiting];
            break;
        case 2006:
             [Hud showSuccessHudWithTitle:@"Timer" detailMessage:@"You've just displated this awesome Pop Up View" clickedFirstBtnTitle:@"Dismiss" clickedSecondBtnTitle:@"" clickedDoneBtnTitle:@"" showType:Timer];
            break;
        case 2007:
             [Hud showSuccessHudWithTitle:@"Question?" detailMessage:@"You've just displated this awesome Pop Up View" clickedFirstBtnTitle:@"Dismiss" clickedSecondBtnTitle:@"" clickedDoneBtnTitle:@"" showType:Question];
            break;
        default:
            break;
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
