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

#import "jKoolWebsocketClient.h"
#import "SocketRocket.h"
//#import "jkViewController.h"


@interface jKoolWebsocketClient () <NSStreamDelegate, NSNetServiceDelegate>


@end

@implementation jKoolWebsocketClient


{
    SRWebSocket *webSocket;
}




@synthesize sendResponse = _sendResponse;
@synthesize subscribeUrl = _subscribeUrl;


- (void)subscribe:(NSString *)jkQuery withMaxRows:(int) maxRows withToken:(NSString *) token withSubId:(NSString *) subId forHandler:(NSObject *) handler{
    _subscribeUrl = [NSString stringWithFormat:@"{\"jk_token\":\"%@\",\"jk_query\":\"%@\",\"jk_maxrows\":%i,\"jk_subid\":\"%@\"}", token, jkQuery, maxRows, subId];
    _sendResponse = handler;
    [self connectWebSocket];
   }

- (void)connectWebSocket {
    webSocket.delegate = nil;
    webSocket = nil;
    
    NSString *urlString = @"ws://jkool.jkoolcloud.com/jkool-service/jkqlasync";
    SRWebSocket *newWebSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:urlString]];
    newWebSocket.delegate = self;
    [newWebSocket open];
    //[NSThread sleepForTimeInterval:10000];
}

- (void)webSocketDidOpen:(SRWebSocket *)newWebSocket {
    webSocket = newWebSocket;
    [webSocket send:_subscribeUrl];
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    //[self connectWebSocket];
    [_sendResponse handlejKoolResponse:[NSString stringWithFormat:@"Failed with error:%@", error]];
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    //[self connectWebSocket];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
        [_sendResponse handlejKoolResponse:message];
}
@end
