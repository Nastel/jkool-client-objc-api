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

#import "jkViewController.h"
#import "jKoolStreaming.h"
#import "jKoolQuerying.h"
#import "jkEvent.h"
#import "jkProperty.h"
#import "jkActivity.h"
#import "jkSnapshot.h"
#import "jkCallbackHandlerStreaming.h"
#import "jkCallbackHandlerQuery.h"
#import "jkCallbackHandlerQuery2.h"
#import "jkCallbackHandlerWebsocket.h"
#import "jKoolWebsocketClient.h"
#import "jkLocation.h"

@implementation jkViewController

jKoolWebsocketClient *jkWebsocketClient;
jKoolStreaming *jkStreaming ;
jKoolQuerying *jkQuerying1;
jKoolQuerying *jkQuerying2;
jkLocation *location;


@synthesize queryText;
@synthesize queryText2;

- (void)viewDidLoad
{
    [super viewDidLoad];
    queryText.text = nil;
    queryText2.text = nil;
    
    // Initialize streaming and specify callback handler.
    NSObject *cbStream = [[jkCallbackHandlerStreaming alloc] initWithViewController:self];
    jkStreaming = [[jKoolStreaming alloc] init];
    [jkStreaming setToken:@"your-token"];
    [jkStreaming initializeStream:cbStream];
   
    // Initialize Querying and specify callback handler
    NSObject *cbQuery = [[jkCallbackHandlerQuery alloc] initWithViewController:self];
    NSObject *cbQuery2 = [[jkCallbackHandlerQuery2 alloc] initWithViewController:self];
    jkQuerying1 = [[jKoolQuerying alloc] init];
    [jkQuerying1 setToken:@"your-token"];
    [jkQuerying1 initializeQuery:cbQuery];
    // Or to use this ViewController as the handler
    //[jkQuerying initializeQuery:self];
    
    jkQuerying2 = [[jKoolQuerying alloc] init];
    [jkQuerying2 setToken:@"your-token"];
    [jkQuerying2 initializeQuery:cbQuery2];
    
    // Kick-off locationing
    location = [[jkLocation alloc] init];
    [location kickOffLocationing];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [jkWebsocketClient unsubscribe];
    [jkStreaming stopStreaming];
    [jkQuerying1 stopQuerying];
    [jkQuerying2 stopQuerying];
}

- (IBAction)stream:(id)sender {
    // Stream Event with snapshot and properties
    jkEvent *event = [[jkEvent alloc] initWithName:@"testEvent"];
    [event setMsgText:@"hello world"] ;
    [event setReasonCode:9];
    [event setException:@"my exception"];
    [event setUser:@"Cathy"];
    
    [event setGeoAddr:[location getCoordinates]];
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
    [activity setJkstatus:JK_END];
    [activity setReasonCode:9];
    [activity setException:@"my exception"];
    [activity setUser:@"Cathy"];
    [activity setGeoAddr:[location getCoordinates]];
    [activity setResource:@"my resource"];
    [activity setCorrId:[NSArray arrayWithObjects:@"123",@"456",@"789", nil]];
    [activity setSourceSsn:@"Test Source"];
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
    NSString *query1 = @"get snapshots";
    [jkQuerying1 query:query1 withMaxRows:50];
    
    NSString *query2 = @"get events";
    [jkQuerying2 query:query2 withMaxRows:50];
}

- (IBAction)subscribe:(id)sender {
    NSObject *cb = [[jkCallbackHandlerWebsocket alloc] initWithViewController:self];
    queryText.text = nil;
    queryText2.text = nil;
    jkWebsocketClient = [[jKoolWebsocketClient alloc] init];
    [jkWebsocketClient subscribe:@"subscribe to events" withMaxRows:10 withToken:@"your-token"  withSubId:@"your-sub-id"  forHandler:cb];
}

- (IBAction)unsubscribe:(id)sender {
    [jkWebsocketClient unsubscribe];
}

// If using this ViewController as the handler.
- (void) handlejKoolResponse:(NSData *) data  {
    NSString * str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    queryText.text = str;
}








@end
