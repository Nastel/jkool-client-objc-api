//
//  jkViewController.h
//  jKooliOSStreaming
//
//  Created by cbdbeb9 on 08/30/2016.
//  Copyright (c) 2016 cbdbeb9. All rights reserved.
//

@import UIKit;
#import "jKoolViewController.h"

@interface jkViewController : jKoolViewController

- (IBAction)stream:(id)sender;
- (void) handlejKoolResponse:(NSString *) data;

@end
