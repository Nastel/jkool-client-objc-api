//
//  Constant.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 8/26/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jkConstants : NSObject

extern NSString *const DefaultDCName;
extern NSString *const DefaultAppName;
extern NSString *const DefaultGeoAddr;
extern NSString *const DefaultServer;
extern NSString *const DefaultNWAddr;
extern NSString *const DefaultCharSet;
extern NSString *const DefaultEncoding;
extern NSString *const DefaultMimeType;
extern NSString *const StreamingUrl;
extern NSString *const QueryingUrl;
typedef enum CompCodes {JK_CC_SUCCESS, JK_CC_WARNING, JK_CC_ERROR} compCodes;
typedef enum Severities {JK_SEV_NONE, JK_SEV_TRACE, JK_SEV_DEBUG, JK_SEV_INFO, JK_SEV_NOTICE, JK_SEV_WARNING, JK_SEV_ERROR, JK_SEV_FAILURE, JK_SEV_CRITICAL, JK_SEV_FATAL, JK_SEV_HALT} severities;
typedef enum EventTypes {JK_TYPE_OTHER, JK_TYPE_NOOP, JK_TYPE_CALL, JK_TYPE_ACTIVITY, JK_TYPE_EVENT, JK_TYPE_SNAPSHOT,JK_TYPE_START, JK_TYPE_STOP, JK_TYPE_OPEN, JK_TYPE_CLOSE, JK_TYPE_SEND, JK_TYPE_RECEIVE, JK_TYPE_INQUIRE, JK_TYPE_SET, JK_TYPE_BROWSE, JK_TYPE_ADD,JK_TYPE_UPDATE,JK_TYPE_REMOVE, JK_TYPE_CLEAR, JK_TYPE_DATAGRAM} eventTypes;
typedef enum Statuses {JK_END, JK_EXCEPTION} statuses;

+ (NSString*)formatEventTypeToString:(eventTypes)et;
+ (NSString*)formatSeveritiesToString:(severities)sev;
+ (NSString*)formatCompCodeToString:(compCodes)cc;
+ (NSString*)formatStatusString:(statuses)st ;

@end
