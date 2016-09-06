//
//  Constant.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 8/26/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "jkConstants.h"

@interface jkTrackable : NSObject

@property enum CompCodes compCode;
@property enum Severities jkSeverity;
@property enum EventTypes type;

@property long long timeUsec;
@property long long startTimeUsec;
@property long long endTimeUsec;
@property long elapsedTimeUsec;
@property long waitTimeUsec;
@property long pid;
@property long tid;

@property int reasonCode;

@property (retain) NSString * trackingId;
@property (retain) NSString * sourceUrl;
@property (retain) NSString * exception;
@property (retain) NSString * parentTrackId;


@property (retain) NSString * dataCenter;
@property (retain) NSString * geoAddr;
@property (retain) NSString * eventName;
@property (retain) NSString * appl;

@property (retain) NSString * location;
@property (retain) NSString * resource;
@property (retain) NSString * server;
@property (retain) NSString * netAddr;
@property (retain) NSString * user;
@property (retain) NSString *sourceFqn;

@property (retain) NSString * corrId;
@property NSMutableArray * properties;
@property NSMutableArray * snapshots;

- (void)setTimeUsecViaDate:(NSDate *)timeUsec;
- (NSMutableArray *) valueList;
- (NSMutableArray *) propertyList;
- (NSString *) path;

@end
