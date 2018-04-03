# NetWorkReachability
Network type judgment

## AFN判断
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变时调用
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"手机自带网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
        }
    }];
    
    //开始监控
    [manager startMonitoring];
        return YES;
}
```

## HLNetWorkReachability判断
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kNetWorkReachabilityChangedNotification object:nil];
    
    HLNetWorkReachability *reachability = [HLNetWorkReachability reachabilityWithHostName:@"www.baidu.com"];
    self.hostReachability = reachability;
    [reachability startNotifier];
    
    return YES;
}

- (void)reachabilityChanged:(NSNotification *)notification
{
    HLNetWorkReachability *curReach = [notification object];
    HLNetWorkStatus netStatus = [curReach currentReachabilityStatus];
    switch (netStatus) {
        case HLNetWorkStatusNotReachable:
            NSLog(@"网络不可用");
            break;
        case HLNetWorkStatusUnknown:
            NSLog(@"未知网络");
            break;
        case HLNetWorkStatusWWAN2G:
            NSLog(@"2G网络");
            break;
        case HLNetWorkStatusWWAN3G:
            NSLog(@"3G网络");
            break;
        case HLNetWorkStatusWWAN4G:
            NSLog(@"4G网络");
            break;
        case HLNetWorkStatusWiFi:
            NSLog(@"WiFi");
            break;
            
        default:
            break;
    }
}
```

## HLNetWorkReachability使用参照https://github.com/Haley-Wong/HLNetWorkReachability
