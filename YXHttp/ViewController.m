//
//  ViewController.m
//  YXHttp
//
//  Created by 中软mac028 on 15/10/27.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "ViewController.h"
#import "PublicDefine.h"
#import "EngineInterface.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerCallBack:) name:NOTIFICATION_REGISTER object:nil];
    EngineInterface* engine = [EngineInterface shareInstance];
    
    [engine userRegisterWithName:@"zyx1122" andPwd:@"qwerty"];
    
}
- (void) registerCallBack:(id) sender {
    if (sender && [sender isKindOfClass:[NSNotification class]]) {
        NSNotification* notification = (NSNotification*) sender;
        
        NSNumber* flag = (NSNumber*) notification.object;
        
        NSLog(@"isSuccess:%@",flag);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
