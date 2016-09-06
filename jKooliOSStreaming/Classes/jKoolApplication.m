//
//  jKoolApplication.m
//  moments
//
//  Created by Catherine Bernardone on 7/5/16.
//  Copyright © 2016 Catherine Bernardone. All rights reserved.
//

#import "jKoolApplication.h"
#import "jkoolstreaming.h"

@implementation jKoolApplication
/*
- (void)sendEvent:(UIEvent*)event {
    //handle the event (you will probably just reset a timer)
    
    [super sendEvent:event];
    NSSet *touches = [event allTouches];
    UIEventType *type = [event type];
    UIEventSubtype *subType = [event subtype];
    
}

- (BOOL)sendAction:(SEL)action
                to:(id)target
              from:(id)sender
          forEvent:(UIEvent *)event
{
   // NSString *targetTitle = [target title];
   // NSString *targetDescription = [target description];
   // NSString *senderTitle = [sender title];
   // NSString *senderDescription = [sender description];
   // NSString *parentViewController = NSStringFromClass([[sender parentViewController] class]);
    jkoolstreaming *jkoolst = [jkoolstreaming sharedInstance];
    long long millisecondslong = (long long)([[NSDate date] timeIntervalSince1970] * 1000000.0);
    NSNumber* milliseconds = [[NSNumber alloc] initWithLongLong:millisecondslong];
    //NSNumber* milliseconds = [[NSNumber alloc] initWithLongLong:1457524800000000];
    NSString *sourceFqn = [@"APPL=Moments#SERVER=WebServer100#NETADDR=11.0.0.2#DATACENTER=DC1#GEOADDR=" stringByAppendingFormat:@"%f,%f", 40.7934322,-73.41512139999999];
    NSArray *objects = [NSArray arrayWithObjects:sourceFqn, @"event", @"EVENT", milliseconds,milliseconds, NSStringFromSelector(action), @"device", nil];
    [jkoolst  stream:objects];
    [super sendAction:action to:target from:sender forEvent:event];
    return YES;
}*/

@end
