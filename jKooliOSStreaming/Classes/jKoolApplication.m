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
