//
//  Constant.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 8/26/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "jkConstants.h"

NSString *const DefaultDCName = @"none";
NSString *const DefaultServer = @"none";
NSString *const DefaultNWAddr = @"none";
NSString *const DefaultAppName = @"ios";
NSString *const DefaultGeoAddr = @"0,0";
NSString *const DefaultCharSet = @"utf-8";
NSString *const DefaultEncoding = @"none";
NSString *const DefaultMimeType =@"text/plain";
NSString *const StreamingUrl = @"https://data.jkoolcloud.com/jesl/";
NSString *const QueryingUrl = @"https://jkool.jkoolcloud.com/jkool-service/jkql";
//NSString *const StreamingUrl = @"http://test.jkoolcloud.com:6580/jesl/event";
//NSString *const QueryingUrl = @"http://test.jkoolcloud.com/jkool-service/jkql";

@implementation jkConstants

+ (NSString*)formatStatusString:(statuses)st {
    NSString *result = nil;
    
    switch(st) {
        case JK_END:
            result = @"END";
            break;
        case JK_EXCEPTION:
            result = @"EXCEPTION";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    
    return result;
}

+ (NSString*)formatCompCodeToString:(compCodes)cc {
    NSString *result = nil;
    
    switch(cc) {
        case JK_CC_SUCCESS:
            result = @"SUCCESS";
            break;
        case JK_CC_WARNING:
            result = @"WARNING";
            break;
        case JK_CC_ERROR:
            result = @"ERROR";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    
    return result;
}

+ (NSString*)formatEventTypeToString:(eventTypes)et {
    NSString *result = nil;
    
    switch(et) {
        case JK_TYPE_OTHER:
            result = @"OTHER";
            break;
        case JK_TYPE_NOOP:
            result = @"NOOP";
            break;
        case JK_TYPE_CALL:
            result = @"CALL";
            break;
        case JK_TYPE_EVENT:
            result = @"EVENT";
            break;
        case JK_TYPE_SNAPSHOT:
            result = @"SNAPSHOT";
            break;
        case JK_TYPE_ACTIVITY:
            result = @"ACTIVITY";
            break;
        case JK_TYPE_START:
            result = @"START";
            break;
        case JK_TYPE_STOP:
            result = @"STOP";
            break;
        case JK_TYPE_OPEN:
            result = @"OPEN";
            break;
        case JK_TYPE_CLOSE:
            result = @"CLOSE";
            break;
        case JK_TYPE_SEND:
            result = @"SEND";
            break;
        case JK_TYPE_RECEIVE:
            result = @"RECEIVE";
            break;
        case JK_TYPE_INQUIRE:
            result = @"INQUIRE";
            break;
        case JK_TYPE_SET:
            result = @"SET";
            break;
        case JK_TYPE_BROWSE:
            result = @"BROWSE";
            break;
        case JK_TYPE_ADD:
            result = @"ADD";
            break;
        case JK_TYPE_UPDATE:
            result = @"UPDATE";
            break;
        case JK_TYPE_REMOVE:
            result = @"REMOVE";
            break;
        case JK_TYPE_CLEAR:
            result = @"CLEAR";
            break;
        case JK_TYPE_DATAGRAM:
            result = @"DATAGRAM";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    
    return result;
}

+ (NSString*)formatSeveritiesToString:(severities)sev {
    NSString *result = nil;
    
    switch(sev) {
        case JK_SEV_INFO:
            result = @"INFO";
            break;
        case JK_SEV_TRACE:
            result = @"TRACE";
            break;
        case JK_SEV_DEBUG:
            result = @"DEBUG";
            break;
        case JK_SEV_NOTICE:
            result = @"NOTICE";
            break;
        case JK_SEV_WARNING:
            result = @"WARNING";
            break;
        case JK_SEV_ERROR:
            result = @"ERROR";
            break;
        case JK_SEV_FAILURE:
            result = @"FAILURE";
            break;
        case JK_SEV_CRITICAL:
            result = @"CRITICAL";
            break;
        case JK_SEV_FATAL:
            result = @"FATAL";
            break;
        case JK_SEV_HALT:
            result = @"HALT";
            break;
        case JK_SEV_NONE:
            result = @"NONE";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    
    return result;
}
@end
