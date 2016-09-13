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

#import "jkViewController.h"
#import "jKoolStreaming.h"
#import "jKoolQuerying.h"
#import "jkEvent.h"
#import "jkProperty.h"
#import "jkActivity.h"
#import "jkSnapshot.h"
#import "jkCallbackHandlerStreaming.h"
#import "jkCallbackHandlerQuery.h"
#import "jkCallbackHandlerWebsocket.h"
#import "jKoolWebsocketClient.h"

@implementation jkViewController

static jKoolWebsocketClient *jkWebsocketClient;
static jKoolStreaming *jkStreaming ;
static jKoolQuerying *jkQuerying;

@synthesize queryText;

- (void)viewDidLoad
{
    [super viewDidLoad];
    queryText.text = nil;
    // Initialize streaming and specify callback handler.
    [jKoolStreaming setToken:@"HdC0YR5u58UTNyPByFe7GXuHgLFtFx28"];
    NSObject *cbStream = [[jkCallbackHandlerStreaming alloc] initWithViewController:self];
    jkStreaming = [[jKoolStreaming alloc] init];
    [jkStreaming initializeStream:cbStream];
    // Initialize Querying and specify callback handler
    [jKoolQuerying setToken:@"HdC0YR5u58UTNyPByFe7GXuHgLFtFx28"];
    NSObject *cbQuery = [[jkCallbackHandlerQuery alloc] initWithViewController:self];
    jkQuerying = [[jKoolQuerying alloc] init];
    [jkQuerying initializeQuery:cbQuery];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [jkWebsocketClient unsubscribe];
    [jkStreaming stopStreaming];
    [jkQuerying stopQuerying];
}

- (IBAction)stream:(id)sender {
    // Stream Event with snapshot and properties
    jkEvent *event = [[jkEvent alloc] initWithName:@"testEvent"];
    [event setMsgText:@"hello world"] ;
    [event setReasonCode:9];
    [event setException:@"my exception"];
    [event setPid:123.0];
    [event setTid:456.0];
    [event setMsgTag:@"hello tag"];
    [event setUser:@"Cathy"];
  //  [event setGeoAddr:@"72.45,80.56"];
    [event setResource:@"my resource"];
    jkProperty *property_event_1 = [[jkProperty alloc] initWithName:@"test1 property" andType:@"test1 type" andValue:@"test1 value"];
    jkProperty *property_event_2 = [[jkProperty alloc] initWithName:@"test2 property" andType:@"test2 type" andValue:@"test2 value"];
    NSMutableArray * properties = [[NSMutableArray alloc] init];
    [properties addObject:property_event_1];
    [properties addObject:property_event_2];
    [event setProperties:properties];
    jkSnapshot *snapshot = [[jkSnapshot alloc] init];
    [snapshot setName:@"test snapshot"];
    [snapshot setCategory:@"snapshot category"];
    [snapshot setTimeUsecViaDate:[NSDate date]];
    jkProperty *property_snapshot_1 = [[jkProperty alloc] initWithName:@"test1 property" andType:@"test1 type" andValue:@"test1 value"];
    jkProperty *property_snapshot_2 = [[jkProperty alloc] initWithName:@"test2 property" andType:@"test2 type" andValue:@"test2 value"];
    properties = [[NSMutableArray alloc] init];
    [properties addObject:property_snapshot_1];
    [properties addObject:property_snapshot_2];
    [snapshot setProperties:properties];
    [snapshot setType:JK_TYPE_SNAPSHOT];
    NSMutableArray * snapshots = [[NSMutableArray alloc] init];
    [snapshots addObject:snapshot];
    [event setSnapshots:snapshots];
    [jkStreaming stream:event forUrl:@"event"];
    
    // Stream Activity
    jkActivity *activity = [[jkActivity alloc] initWithName:@"test activity"];
    [activity setJkStatus:JK_END];
    [activity setReasonCode:9];
    [activity setException:@"my exception"];
    [activity setPid:123.0];
    [activity setTid:456.0];
    [activity setUser:@"Cathy"];
    [activity setGeoAddr:@"72.45,80.56"];
    [activity setResource:@"my resource"];
    jkProperty *property_activity_1 = [[jkProperty alloc] initWithName:@"test1 property" andType:@"test1 type" andValue:@"test1 value"];
    jkProperty *property_activity_2 = [[jkProperty alloc] initWithName:@"test2 property" andType:@"test2 type" andValue:@"test2 value"];
    properties = [[NSMutableArray alloc] init];
    [properties addObject:property_activity_1];
    [properties addObject:property_activity_2];
    [activity setProperties:properties];
    [jkStreaming stream:activity forUrl:@"activity"] ;
}

- (IBAction)query:(id)sender {
    
    // Query

    NSString *query = @"get events";
    [jkQuerying query:query withMaxRows:50];

    

}

- (IBAction)subscribe:(id)sender {
    NSObject *cb = [[jkCallbackHandlerWebsocket alloc] initWithViewController:self];
    queryText.text = nil;
    jkWebsocketClient = [[jKoolWebsocketClient alloc] init];
    [jkWebsocketClient subscribe:@"subscribe to events" withMaxRows:10 withToken:@"HdC0YR5u58UTNyPByFe7GXuHgLFtFx28"  withSubId:@"$sub/9577682d-26ae-4f50-8293-cd4640a368f6"  forHandler:cb];
}

- (IBAction)unsubscribe:(id)sender {
    [jkWebsocketClient unsubscribe];
}

// Uncomment if you wish for this ViewController to be the handler.
/*- (IBAction)query:(id)sender {
    
    // Initialize Streaming and specify callback handler
    [jKoolQuerying setToken:@"your-token"];
   
    
    // Query
    jKoolQuerying *jkQuerying = [[jKoolQuerying alloc] init];
    NSString *query = @"get events";
    [jkQuerying query:query withMaxRows:50 forHandler:self];
    
    
}*/

- (void) handlejKoolResponse:(NSData *) data  {
    
    NSString * str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"jKool Data"
                                  message:str
                                  preferredStyle:UIAlertControllerStyleActionSheet
                                  ];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    
    [alert addAction:ok];
    
    alert.popoverPresentationController.sourceView = self.view;
    alert.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
    
    [self presentViewController:alert animated:YES completion:nil];
}








@end
