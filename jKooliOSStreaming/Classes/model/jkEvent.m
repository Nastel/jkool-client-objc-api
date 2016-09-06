//
//  Constant.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 8/26/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import "jkEvent.h"
#import "jkTrackable.h"
#import "jkProperty.h"
#import "jkConstants.h"
#import "jKoolStreaming.h"

@implementation jkEvent

@synthesize msgCharset = _msgCharset;
@synthesize msgText = _msgText;
@synthesize msgTag = _msgTag;
@synthesize msgAgeUsec = _msgAgeUsec;
@synthesize msgEncoding = _msgEncoding;
@synthesize msgMimeType = _msgMimeType;
@synthesize msgSize = _msgSize;


// Msg Charset
- (NSString *)msgCharset {
    if (_msgText && !_msgCharset) {
        _msgCharset = DefaultCharSet;
    }
    
    return _msgCharset;
}

- (void)setServer:(NSString *)msgCharset {
    _msgCharset = msgCharset;
}
// Msg Encoding
- (NSString *)msgEncoding {
    if (_msgText && !_msgEncoding) {
        _msgEncoding = DefaultEncoding;
    }
    
    return _msgEncoding;
}

- (void)setMsgEncoding:(NSString *)msgEncoding:(NSString *)msgEncoding {
    _msgEncoding = msgEncoding;
}
// Msg Mime Type
- (NSString *)msgMimeType {
    if (_msgText && !_msgMimeType) {
        _msgMimeType = DefaultMimeType;
    }
    
    return _msgMimeType;
}

- (void)setMsgMimeType:(NSString *)msgMimeType:(NSString *)msgMimeType {
    _msgMimeType = msgMimeType;
}
// Msg Size
- (int) msgSize {
    if (_msgText) {
        _msgSize = _msgText.length;
    }
    
    return 0;
}

- (void)setMsgSize:(int)msgSize {
    _msgSize = msgSize;
}

- (id)init {
    self = [super init];
    [self setType: JK_TYPE_EVENT];
    return self;
    
}

- (id)initWithName: (NSString*)name {
    self = [self init];
    [self setEventName:name];
    return self;
}

- (id)initWithName: (NSString*)name andTrackingId:(NSString*)trackingId  {
    self = [self initWithName:name andTrackingId:trackingId];
    [self setEventName:name];
    return self;
}

- (id)initWithName: (NSString*)name andTimeUsecAsLong:(long)timeUsec andTrackingId:(NSString*)trackingId  {
    self = [self initWithName:name andTrackingId:trackingId];
    [self setTimeUsec:timeUsec];
    return self;
}

- (id)initWithNameAndTimeUsec: (NSString*)name andTimeUsecAsDate:(NSDate*)timeUsec andTrackingId:(NSString*)trackingId  {
    self = [self initWithName:name andTrackingId:trackingId];
    [self setTimeUsecViaDate:timeUsec];
    return self;
}


- (NSMutableArray *) propertyList {
    NSMutableArray * properties = [super propertyList];
    if ([self msgEncoding] != nil)
    {
        [properties addObject: @"encoding"];
    }
    if ([self msgCharset] != nil)
    {
        [properties addObject: @"charset"];
    }
    if ([self msgText] != nil)
    {
        [properties addObject: @"msg-text"];
    }
    if ([self msgTag] != nil)
    {
        [properties addObject: @"msg-tag"];
    }
    if ([self msgSize] > 0)
    {
        [properties addObject: @"msg-size"];
    }
    if ([self msgMimeType]  != nil)
    {
        [properties addObject: @"mime-type"];
    }
    if ([self msgAgeUsec ]!= nil)
    {
        [properties addObject:  @"msg-age"];
    }
    return properties;
}

- (NSMutableArray *) valueList {
    NSMutableArray * values = [super valueList];

    if ([self msgEncoding] != nil)
    {
        [values addObject: [NSString stringWithFormat:@"%@", [self msgEncoding]]];
    }
    if ([self msgCharset] != nil)
    {
        [values addObject: [NSString stringWithFormat:@"%@", [self msgCharset]]];
    }
    if ([self msgText] != nil)
    {
        [values addObject: [NSString stringWithFormat:@"%@", [self msgText]]];
    }
    if ([self msgTag] != nil)
    {
        [values addObject: [NSString stringWithFormat:@"%@", [self msgTag]]];
    }
    if ([self msgSize] > 0)
    {
        [values addObject: [NSString stringWithFormat:@"%i", [self msgSize]]];
    }
    if ([self msgMimeType] != nil)
    {
        [values addObject: [NSString stringWithFormat:@"%@", [self msgMimeType]]];
    }
    if ([self msgAgeUsec] != nil && [self msgAgeUsec] > 0)
    {
        [values addObject: [NSString stringWithFormat:@"%i", [self msgAgeUsec]]];
    }
    return values;
}

- (void) stream: (UIViewController *) handler {
    jKoolStreaming *jkStreaming = [[jKoolStreaming alloc] init];
    [jkStreaming stream:self forPath:@"event" forHandler:handler] ;
}


@end
