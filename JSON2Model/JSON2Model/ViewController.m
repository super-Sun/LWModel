//
//  ViewController.m
//  JSON2Model
//
//  Created by sunluwei on 15/6/20.
//  Copyright © 2015年 hador. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Model.h"
#import "NSObject+Property.h"
#import "Friends.h"

@interface ViewController ()

@property (nonatomic, strong) NSDictionary *modelDict;

@end

@implementation ViewController

- (NSDictionary *)modelDict {
    
    if (!_modelDict) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        self.modelDict = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return _modelDict;
    
}
/**
 *  KVC:去字典中遍历所有的key，保存到模型中
 *  runtime:根据模型中的属性，去字典中找对应的key，保存到模型
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[NSObject createPropertyCodeWithDict:self.modelDict];
    Friends *friends = [Friends modelWithDict:self.modelDict];
    //可以通过在此打断点查看 JSON2Model 是否成功、
    NSLog(@"%@",friends.friends);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
