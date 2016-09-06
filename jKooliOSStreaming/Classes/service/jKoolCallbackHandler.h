//
//  jkViewController.h
//  jKooliOSStreaming
//
//  Created by cbdbeb9 on 08/30/2016.
//  Copyright (c) 2016 cbdbeb9. All rights reserved.
//

@import UIKit;

@interface jKoolCallbackHandler : NSObject

@property (retain) UIViewController * vc;

- (void) handlejKoolResponse:(NSData *) data;
- (id)initWithViewController: (UIViewController *) vc;

@end
