/*
 * Copyright (c) 2010 jKool, LLC. All Rights Reserved.
 *
 * This software is the confidential and proprietary information of
 * jKool, LLC. ("Confidential Information").  You shall not disclose
 * such Confidential Information and shall use it only in accordance with
 * the terms of the license agreement you entered into with jKool, LLC.
 *
 * JKOOL MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF
 * THE SOFTWARE, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE, OR NON-INFRINGEMENT. JKOOL SHALL NOT BE LIABLE FOR ANY DAMAGES
 * SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR DISTRIBUTING
 * THIS SOFTWARE OR ITS DERIVATIVES.
 *
 * CopyrightVersion 1.0
 *
 */

#import <Foundation/Foundation.h>
#import "jkConstants.h"
#import <CoreLocation/CoreLocation.h>

@interface jkTrackable : NSObject <CLLocationManagerDelegate>

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
