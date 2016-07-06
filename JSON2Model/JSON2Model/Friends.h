//
//  Friends.h
//  JSON2Model
//
//  Created by sunluwei on 15/6/20.
//  Copyright © 2015年 hador. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Friend.h"
//@class Friend;
@interface Friends : NSObject
@property (nonatomic ,strong) Friend *friend;

@property (nonatomic, strong) NSArray *friends;

@property (nonatomic, assign) int online;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL isVIP;

@end
