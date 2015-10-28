//
//  EngineInterface.m
//  YXHttp
//
//  Created by 中软mac028 on 15/10/27.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "EngineInterface.h"
#import "YXHttpClient.h"
#import "NSString+Encryption.h"
#import "UserInfo.h"
#import "PublicDefine.h"


#define REGISTER_URL @"http://192.168.1.128/myproject/register.php"
#define LOGIN_URL @"http://192.168.1.128/myproject/login.php"

@interface EngineInterface () <YXHttpClientDelegate>
{
    
}
@end

@implementation EngineInterface

+ (instancetype) shareInstance {
    static EngineInterface* instance = nil;
    static dispatch_once_t onceToken;
    
    if (instance == nil) {
        dispatch_once(&onceToken, ^(){
            instance = [[EngineInterface alloc] init];
        });
    }
    
    return instance;
}

- (void) userRegisterWithName:(NSString *)username andPwd:(NSString *)userpwd
{
    YXHttpClient* client = [YXHttpClient shareInstance];
    client.delegate = self;
    
    NSString* body = [NSString stringWithFormat:@"username=%@&userpwd=%@",username,[NSString md5Encrytion:userpwd]];
    
    [client httpPostRequest:REGISTER_URL andBody:body];
    
}
- (void) userLoginWithName:(NSString*) username andPwd:(NSString*)userpwd
{
    YXHttpClient* client = [YXHttpClient shareInstance];
    client.delegate = self;
    
    NSString* body = [NSString stringWithFormat:@"username=%@&userpwd=%@",username,[NSString md5Encrytion:userpwd]];
    
    [client httpPostRequest:LOGIN_URL andBody:body];
}

#pragma mark - YXHttpClientDelegate

- (void) launchFinished:(NSData *) data{
    
    if (data && data.length > 0 ) {
        
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSNumber* flag = (NSNumber*)[dic objectForKey:@"ret"];
        NSDictionary* data = (NSDictionary*)[dic objectForKey:@"responseData"];
       
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_REGISTER object:flag];
            
    }
   
    
    
}
- (void) launchFailed {
    
}

@end
