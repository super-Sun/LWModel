//
//  NSObject+Model.h
//  JSON2Model
//
//  Created by sunluwei on 15/6/20.
//  Copyright © 2015年 hador. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>
/**
 *  runtime:遍历模型中所有属性名，去字典中查找
 *  属性定义在哪？定义在类中，类里面有个属性列表(数组)
 */
@interface NSObject (Model)

+ (instancetype)modelWithDict:(NSDictionary *)dict;
/** 该方法用于：当模型中数组属性内部元素也为模型，实现该方法，用法见Friends模型*/
- (NSDictionary *)objectClassInArray;

@end
