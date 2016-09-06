//
//  Constant.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 8/26/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "jkTrackable.h"

@interface jkEvent : jkTrackable
{

}

@property (retain) NSString * msgText;
@property (retain) NSString * msgTag;
@property (retain) NSString *  msgCharset;
@property (retain) NSString *  msgEncoding;
@property (retain) NSString *  msgMimeType;
@property long msgAgeUsec;
@property int msgSize;

- (NSMutableArray *) propertyList;
- (NSMutableArray *) valueList;
- (id)initWithName: (NSString*)name;
- (id)initWithName: (NSString*)name andTrackingId:(NSString*)trackingId;
- (id)initWithName: (NSString*)name andTimeUsecAsLong:(long)timeUsec andTrackingId:(NSString*)trackingId;
- (id)initWithNameAndTimeUsec: (NSString*)name andTimeUsecAsDate:(NSDate*)timeUsec andTrackingId:(NSString*)trackingId;
- (NSString *) path;
- (void) stream: (UIViewController *) handler;




@end
