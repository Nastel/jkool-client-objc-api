//
//  jkViewController.m
//  jKooliOSStreaming
//
//  Created by cbdbeb9 on 08/30/2016.
//  Copyright (c) 2016 cbdbeb9. All rights reserved.
//

#import "jKoolCallbackHandler.h"
#import "jKoolStreaming.h"
#import "jKoolQuerying.h"
#import "jkEvent.h"
#import "jkProperty.h"
#import "jkActivity.h"
#import "jkSnapshot.h"

@interface jKoolCallbackHandler ()

@end

@implementation jKoolCallbackHandler

@synthesize vc;

- (id)initWithViewController: (UIViewController *) vc  {
    [self setVc:vc];
    return self;
}

- (void) handlejKoolResponse:(NSData *) data {

}

@end
