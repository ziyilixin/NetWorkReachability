//
//  ViewController.m
//  NetWork
//
//  Created by hjbsj on 2018/3/29.
//  Copyright © 2018年 hjb. All rights reserved.
//

#import "ViewController.h"
#import "HLNetWorkReachability.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *netWorkTypeLab;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kNetWorkReachabilityChangedNotification object:nil];
    
}

- (void)reachabilityChanged:(NSNotification *)notification
{
    HLNetWorkReachability *curReach = [notification object];
    HLNetWorkStatus netStatus = [curReach currentReachabilityStatus];
    switch (netStatus) {
        case HLNetWorkStatusNotReachable:
            self.netWorkTypeLab.text = @"网络不可用";
            break;
        case HLNetWorkStatusUnknown:
            self.netWorkTypeLab.text = @"未知网络";
            break;
        case HLNetWorkStatusWWAN2G:
            self.netWorkTypeLab.text = @"2G网络";
            break;
        case HLNetWorkStatusWWAN3G:
            self.netWorkTypeLab.text = @"3G网络";
            break;
        case HLNetWorkStatusWWAN4G:
            self.netWorkTypeLab.text = @"4G网络";
            break;
        case HLNetWorkStatusWiFi:
            self.netWorkTypeLab.text = @"WiFi";
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
