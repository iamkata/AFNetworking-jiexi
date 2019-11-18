//
//  EOCNetMonitor.m
//  EOCAFThreeClass
//
//  Created by EOC on 2017/6/23.
//  Copyright © 2017年 EOC. All rights reserved.
//

#import "EOCNetMonitor.h"
#import "AFNetworking.h"

@interface EOCNetMonitor ()
@property (nonatomic, strong)AFNetworkReachabilityManager *netReachabilityManager;
@end

@implementation EOCNetMonitor

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"网络监听";
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (!_netReachabilityManager) {
        [self addMonitor];
    }
    
}

- (void)addMonitor{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNet:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
    _netReachabilityManager = [AFNetworkReachabilityManager managerForDomain:@"www.baidu.com"];
    
    
//    _netReachabilityManager = [AFNetworkReachabilityManager manager];
//    [self addObserver:self forKeyPath:@"netReachabilityManager" options:NSKeyValueObservingOptionNew context:nil];
    
    
    [_netReachabilityManager startMonitoring];
    
}

- (void)testNet:(NSNotification*)notif
{
    AFNetworkReachabilityStatus status = [[notif.userInfo objectForKey:AFNetworkingReachabilityNotificationStatusItem] intValue];
    
    NSLog(@"NetStatus:%@", AFStringFromNetworkReachabilityStatus(status));
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"===%@", change);
    
}


- (void)dealloc{
    
    [self removeObserver:self forKeyPath:@"netReachabilityManager"];
}


@end
