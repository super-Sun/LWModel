//
//  JSON2Model
//
//  Created by sunluwei on 15/6/20.
//  Copyright © 2015年 hador. All rights reserved.
//

#import "NSObject+Model.h"

@implementation NSObject (Model)

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    
    id objc = [[self alloc] init];
    
    //遍历模型所有属性,区别于成员属性（Ivar）
    //1.获取所有成员属性
    /**
     *  class_copyIvarList:把成员属性列表复制一份给你
     *  Ivar *:指向Ivar指针
     *  Ivar *:指向成员变量数组
     *  class:获取哪个类的成员属性列表
     */
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        //获取属性名，并去处第一次位下滑线_
        NSString *propertyName = [[NSString stringWithUTF8String:ivar_getName(ivar)] substringFromIndex:1];
        NSString *propertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];

//        NSLog(@"name = %@, type = %@", propertyName, propertyType);
        //用KVC给对象属性赋值
        id value = dict[propertyName];
        
        //需要判断对象的还需要 字典 --> model
        if ([value isKindOfClass:[NSDictionary class]] && ![propertyType containsString:@"NS"]) {
            //拿到这个需要转的对象的类型
            NSString *className = [[propertyType substringFromIndex:2] substringToIndex:propertyType.length - 2 - 1];
//            NSLog(@"------:%@", className);
            Class modelClass = NSClassFromString(className);
            
            if (modelClass) {
               value = [modelClass modelWithDict:value];
            }
        }
        
        
        if ([value isKindOfClass:[NSArray class]]) {
            //获取需要转成模型数组的属性名
            NSDictionary *dict = [objc objectClassInArray];
            
            if ([[dict allKeys] containsObject:propertyName]) {
                
                Class modelClass = dict[propertyName];
                NSMutableArray *modelArray = [NSMutableArray array];
                if (modelClass) {
                    for (NSDictionary *subDict in value) {
                        id model = [modelClass modelWithDict:subDict];
                        [modelArray addObject:model];
                    }
                }
                value = modelArray;
            }
        }
        
        if (value) {
            
            [objc setValue:value forKey:propertyName];
            
        }
    }
    
    return objc;
}


#pragma mark - 字典数组转模型数组
/**
 *  通过字典数组来创建一个模型数组
 *  @param keyValuesArray 字典数组
 *  @return 模型数组
 */
+ (NSArray *)objectArrayWithKeyValuesArray:(NSArray *)keyValuesArray
{
    // 1.判断真实性
    if (![keyValuesArray isKindOfClass:[NSArray class]]) {
        [NSException raise:@"keyValuesArray is not a NSArray - keyValuesArray不是一个数组" format:@"keyValuesArray is a %@ - keyValuesArray参数是一个%@", keyValuesArray.class, keyValuesArray.class];
    }
    
    // 2.创建数组
    NSMutableArray *modelArray = [NSMutableArray array];
    
    // 3.遍历
    for (NSDictionary *keyValues in keyValuesArray) {
        if (![keyValues isKindOfClass:[NSDictionary class]]) continue;
        
        id model;
        [modelArray addObject:model];
    }
    
    return modelArray;
}


@end
