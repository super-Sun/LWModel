//
//  Friends.m
//  JSON2Model
//
//  Created by sunluwei on 15/6/20.
//  Copyright © 2015年 hador. All rights reserved.
//

#import "Friends.h"
#import "NSObject+Model.h"

@implementation Friends

- (NSDictionary *)objectClassInArray
{
    return @{@"friends" : [Friend class]};
}

@end
