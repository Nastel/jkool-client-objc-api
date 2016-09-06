//
//  Constant.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 8/26/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jkSnapshot : NSObject
{

}

@property NSString * category;
@property NSString * name;
@property long long timeUsec;
@property NSArray *  properties;
@property enum EventTypes type;
- (void)setTimeUsecViaDate:(NSDate *)timeUsec;
- (NSMutableArray *) propertyList;
- (NSMutableArray *) valueList;



@end
