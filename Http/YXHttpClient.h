//
//  YXHttpClient.h
//  YXHttp
//
//  Created by 中软mac028 on 15/10/27.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YXHttpClientDelegate <NSObject>

- (void) launchFinished:(NSData *) data;
- (void) launchFailed;

@end

@interface YXHttpClient : NSObject

@property (nonatomic, weak) id<YXHttpClientDelegate> delegate;

+(instancetype) shareInstance;

- (void) httpGetRequest:(NSString*) urlPath;

- (void) httpPostRequest:(NSString*) urlPath andBody:(NSString*) body;

@end
