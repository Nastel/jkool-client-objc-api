//
//  Constant.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 8/26/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "jkTrackable.h"
#import "jkConstants.h"

@interface jkActivity : jkTrackable
{

}

@property enum Statuses jkStatus;

- (id)initWithName: (NSString*)name;
- (id)initWithName: (NSString*)name andTrackingId:(NSString*)trackingId;
- (id)initWithName: (NSString*)name andTimeUsecAsLong:(long)timeUsec andTrackingId:(NSString*)trackingId;
- (id)initWithNameAndTimeUsec: (NSString*)name andTimeUsecAsDate:(NSDate*)timeUsec andTrackingId:(NSString*)trackingId;
- (void) stream: (UIViewController *) handler;


@end
