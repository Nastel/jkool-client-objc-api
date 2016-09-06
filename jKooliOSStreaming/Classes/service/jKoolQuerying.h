//
//  jkoolstreaming.h
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 7/5/16.
//  Copyright © 2016 jKool. All rights reserved.
// 

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "jkEvent.h"
#import "jkActivity.h"
#import "jkSnapshot.h"
#import "jKoolService.h"

@interface jKoolQuerying : jKoolService

- (void)query:(NSString *)query withMaxRows:(int) maxRows forHandler:(NSObject *) handler;
+ (NSString*)token;
+ (void)setToken:(NSString*)jkToken;

@end
