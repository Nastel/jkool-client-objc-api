//
//  jkViewController.m
//  jKooliOSStreaming
//
//  Created by cbdbeb9 on 08/30/2016.
//  Copyright (c) 2016 cbdbeb9. All rights reserved.
//

#import "jkViewController.h"
#import "jKoolStreaming.h"
#import "jKoolQuerying.h"
#import "jkEvent.h"
#import "jkProperty.h"
#import "jkActivity.h"
#import "jkSnapshot.h"
#import "jKoolViewController.h"

@interface jkViewController ()

@end

@implementation jkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stream:(id)sender {
    [jKoolStreaming setToken:@"HdC0YR5u58UTNyPByFe7GXuHgLFtFx28"];
    // Stream Event
    jkEvent *event = [[jkEvent alloc] initWithName:@"testEvent"];
    [event setMsgText:@"hello world"] ;
    [event setReasonCode:9];
    [event setException:@"my exception"];
    [event setPid:123.0];
    [event setTid:456.0];
    [event setMsgTag:@"hello tag"];
    [event setUser:@"Cathy"];
    [event setGeoAddr:@"72.45,80.56"];
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
    [event stream: nil];
    
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
    [activity stream: self];
}

- (IBAction)query:(id)sender {
    // prod
    [jKoolQuerying setToken:@"pMxldK4vZxoI4yQs1VHhASZmusLja9Td"];
    jKoolQuerying *jkQuerying = [[jKoolQuerying alloc] init];
    NSString *query = @"get events";
    [jkQuerying query:query withMaxRows:50 forHandler:self];
    

}

- (void) handlejKoolResponse:(NSString *) data {
// Popup
    [super handlejKoolResponse:data];
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Stream Data"
                                  message:data
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
