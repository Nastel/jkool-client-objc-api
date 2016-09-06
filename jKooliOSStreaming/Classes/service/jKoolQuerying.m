//
//  jkoolstreaming.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 7/5/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import "jKoolQuerying.h"
#import "jkConstants.h"

@implementation jKoolQuerying

static NSString *token = nil;

+ (NSString*)token {
    return token;
}

+ (void)setToken:(NSString*)jkToken {
    if(token != jkToken) {
        token = jkToken;
    }
}

- (void)query:(NSString *)query withMaxRows:(int) maxRows forHandler:(UIViewController *) handler{
    query = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *queryUrl = [NSString stringWithFormat:@"%@?jk_query=%@&jk_maxRows=%i&jk_token=%@", QueryingUrl, query, maxRows, token];
    NSURL *url = [NSURL URLWithString:queryUrl];
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60000.0];
    [request setHTTPMethod:@"GET"];
    // As an alternative, token can also be set in the header
    [request setValue:token forHTTPHeaderField:@"token"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:request];
    [dataTask resume];
    if (handler != nil)
    {
        [self setSendResponse:handler];
    }
}



@end
