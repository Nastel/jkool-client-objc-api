/*
 * Copyright (c) 2016 jKool, LLC. All Rights Reserved.
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

@import UIKit;
#import "jKoolWebsocketClient.h"

@interface jkViewController : UIViewController 
{
    IBOutlet UITextView *queryText;
    IBOutlet UITextView *queryText2;
}
@property (retain) UITextView * queryText;
@property (retain) UITextView * queryText2;
- (IBAction)stream:(id)sender;
- (IBAction)query:(id)sender;
- (IBAction)subscribe:(id)sender;
- (IBAction)unsubscribe:(id)sender;


@end
