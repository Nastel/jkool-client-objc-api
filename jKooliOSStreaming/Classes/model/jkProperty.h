//
//  Constant.m
//  jkoolstreaming
//
//  Created by Catherine Bernardone on 8/26/16.
//  Copyright © 2016 jKool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jkProperty : NSObject
{

}
@property NSString * name;
@property NSString * type;
@property NSObject * value;
@property NSString * valueType;

- (bool) isvalid;
- (id)initWithName: (NSString*)name andType:(NSString*)type andValue:(NSString*)value;
- (NSMutableArray *) propertyList;
- (NSMutableArray *) valueList;
@end
