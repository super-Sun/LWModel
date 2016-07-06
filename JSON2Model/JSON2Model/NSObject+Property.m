//
//  NSObject+Property.m
//  JSON2Model
//
//  Created by sunluwei on 15/6/20.
//  Copyright © 2015年 hador. All rights reserved.
//  通过解析字典生成属性代码

#import "NSObject+Property.h"

@implementation NSObject (Property)

+ (NSString *)createPropertyCodeWithDict:(NSDictionary *)dict {
    //待会儿要生成这样格式的字符串：@property (nonatomic, strong) NSDictionary *modelDict;
    //字符串内部 变量：strong nsdictionary modelDict
    NSMutableString *muStr = [[NSMutableString alloc] init];
    [muStr appendFormat:@"\n字典中属性转代码："];
    //遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull proprtyName, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        NSLog(@"type:%@", [obj class]);
        /** 最终的字符串*/
        NSString *code = nil;
        
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@", proprtyName];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@", proprtyName];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@", proprtyName];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@", proprtyName];
        }
        //
        [muStr appendFormat:@"\n%@;\n",code ];

    }];
    
    NSLog(@"%@",muStr);
    
    return nil;
}

@end
