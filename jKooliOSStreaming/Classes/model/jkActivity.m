//
//  Constant.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 8/26/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import "jkActivity.h"
#import "jkTrackable.h"
#import "jKoolStreaming.h"

@implementation jkActivity

@synthesize jkStatus = _jkStatus;

- (enum Statuses)jkStatus {
    if (!_jkStatus && [self exception] != nil) {
        _jkStatus = JK_END;
    }
    else
    {
        _jkStatus = JK_EXCEPTION;
    }
    return _jkStatus;
}

- (void)setStatus:(enum Statuses)jkStatus {
    _jkStatus = jkStatus;
}

- (id)init {
    self = [super init];
    [self setType: JK_TYPE_ACTIVITY];
    return self;
}

- (id)initWithName: (NSString*)name  {
    self = [self init];
    [self setEventName:name];
    return self;
}

- (id)initWithName: (NSString*)name andTrackingId:(NSString*)trackingId  {
    self = [self initWithName:name];
    [self setTrackingId:trackingId];
    return self;
}

- (id)initWithName: (NSString*)name andTimeUsecAsLong:(long)timeUsec andTrackingId:(NSString*)trackingId  {
    self = [self initWithName:name andTrackingId: trackingId];
    [self setTimeUsec:timeUsec];
    return self;
}

- (id)initWithNameAndTimeUsec: (NSString*)name andTimeUsecAsDate:(NSDate*)timeUsec andTrackingId:(NSString*)trackingId  {
    self = [self initWithName:name andTrackingId: trackingId];
    [self setTimeUsecViaDate:timeUsec];
    return self;
}
- (NSMutableArray *) propertyList {
    NSMutableArray * properties = [super propertyList];
    [properties addObject: @"status"];
    return properties;
}

- (NSMutableArray *) valueList {
    NSMutableArray * values = [super valueList];
   [values addObject: [NSString stringWithFormat:@"%@", [jkConstants formatStatusString:[self jkStatus]]]];
     return values;
}

- (void) stream: (UIViewController *) handler {
    jKoolStreaming *jkStreaming = [[jKoolStreaming alloc] init];
    [jkStreaming stream:self forPath:@"activity" forHandler:handler];
}



@end
