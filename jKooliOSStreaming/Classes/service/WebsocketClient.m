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

#import "WebsocketClient.h"
#import "JsonParser.h"



@interface WebsocketClient () <NSStreamDelegate, NSNetServiceDelegate>


@end

@implementation WebsocketClient
@synthesize jsonParser = _jsonParser;
@synthesize dataToSend = _dataToSend;

-(BOOL) initializeConnection {
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"wss://jkool.jkoolcloud.com/jkool-service/jkqlasync", 8887, &readStream, &writeStream);
    
    NSInputStream *inputStream = (NSInputStream *)CFBridgingRelease(readStream);
    NSOutputStream *outputStream = (NSOutputStream *)CFBridgingRelease(writeStream);
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [inputStream open];
    [outputStream open];
    
    if (inputStream) {
       // [self sendInitialGameMessage];
        return YES;
    } else {
        return NO;
    }
}

- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
    
    switch (streamEvent) {
            
        case NSStreamEventHasBytesAvailable: {
            uint8_t *buffer;
            NSUInteger length;
            [(NSInputStream *)theStream read:buffer maxLength:length];
            
            NSData *data = [NSData dataWithBytes:buffer length:length];
            NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            [_jsonParser acceptString:string];
            // send to handler ...
            break;
        }
            
        case NSStreamEventHasSpaceAvailable: {
            if (_dataToSend != nil) {
                uint8_t *writeBytes = (uint8_t *)_dataToSend.UTF8String ;
                [(NSOutputStream *)theStream write:writeBytes maxLength:[_dataToSend length]];
                _dataToSend = nil;
            }
            break;
        }
            
        default:
            break;
    }
}

- (void) subscribe {
    [self setDataToSend:@"{\"jk_token\":\"pMxldK4vZxoI4yQs1VHhASZmusLja9Td\",\"jk_query\":\"subscribe to events\",\"jk_maxrows\":10,\"jk_subid\":\"$sub/9577682d-26ae-4f50-8293-cd4640a368f6\"}"];
    [self initializeConnection];
}


@end
