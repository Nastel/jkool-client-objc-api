//
//  jkoolstreaming.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 7/5/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import "jKoolStreaming.h"
#import "jkConstants.h"

static NSMutableString *g_token = nil;

@implementation jKoolStreaming

+ (NSString*)token {
    extern NSMutableString *g_token;
    return g_token;
}

+ (void)setToken:(NSString*)jkToken {
    extern NSMutableString *g_token;
    if(g_token == nil || ![g_token isEqualToString: jkToken]) {
        g_token = [NSMutableString stringWithString: jkToken];
    }
}

- (void)stream:(jkTrackable *)trackable forPath:(NSString *) path forHandler:(UIViewController *) handler{
   NSDictionary *jKoolDict = [self createJson:trackable];
   NSData *requestData = [NSJSONSerialization  dataWithJSONObject:jKoolDict options:NSJSONWritingPrettyPrinted error:0];
    NSString *strData = [[NSString alloc]initWithData:requestData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",strData);
    NSURL *url = [NSURL URLWithString:[StreamingUrl stringByAppendingString:path]];
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request addValue:g_token forHTTPHeaderField:@"token"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody: requestData];
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:request];
    [dataTask resume];
    if (handler != nil)
    {
        [self setSendResponse:handler];
    }
}


- (NSDictionary *)createJson:(jkTrackable *)trackable  {
    NSMutableArray * properties = [trackable propertyList];
    NSMutableArray * values = [trackable valueList];
    return [NSDictionary dictionaryWithObjects:values forKeys:properties];
}

@end
