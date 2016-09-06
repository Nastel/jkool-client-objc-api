//
//  jkoolstreaming.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 7/5/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import "jKoolService.h"
#import "jkConstants.h"
#import "jKoolCallbackHandler.h"

@implementation jKoolService
@synthesize sendResponse;

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSString * str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Received String %@",str);
    [sendResponse handlejKoolResponse:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if(error == nil)
    {
        NSLog(@"Download is Succesfull");
    }
    else
        NSLog(@"Error %@",[error userInfo]);
}




@end
