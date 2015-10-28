//
//  EngineInterface.h
//  YXHttp
//
//  Created by 中软mac028 on 15/10/27.
//  Copyright (c) 2015年 中软mac028. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol  EngineInterfaceDelegate<NSObject>



@end

@interface EngineInterface : NSObject

+ (instancetype) shareInstance;

- (void) userRegisterWithName:(NSString*) username andPwd:(NSString*) userpwd;
@end
