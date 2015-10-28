//
//  YXHttpClient.m
//  YXHttp
//
//  Created by 中软mac028 on 15/10/27.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import "YXHttpClient.h"

@interface YXHttpClient ()<NSURLConnectionDelegate>
{
    
}
@end

@implementation YXHttpClient

+(instancetype) shareInstance
{
    static YXHttpClient* instance = nil;
    static dispatch_once_t onceToken;
    
    if (instance == nil) {
        dispatch_once(&onceToken, ^(){
            instance = [[YXHttpClient alloc] init];
        });
    }
    
    return instance;
}

- (void) httpGetRequest:(NSString*) urlPath {
    
    NSURL * url = [NSURL URLWithString:urlPath];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
   [NSURLConnection connectionWithRequest:request delegate:self];
    
}
- (void) httpPostRequest:(NSString *)urlPath andBody:(NSString *)body
{
    NSURL * url = [NSURL URLWithString:urlPath];
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    request.URL = url;
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}


#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(launchFailed)]) {
        [self.delegate launchFailed];
    }
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    if (self.delegate && [self.delegate respondsToSelector:@selector(launchFinished:)]) {
        [self.delegate launchFinished:data];
    }
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
}
@end
