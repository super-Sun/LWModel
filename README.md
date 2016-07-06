# LWModel
JSON2Model
该项目通过runtime实现 字典转模型，主要技术点会在注释中体现。

#使用方法

  1.  将NSObject+Model.h、NSObject+Model.m，拷贝到项目中，导入头文件 #import "NSObject+Model.h"
  
  2.  直接调用：YourModel *model = [YourModel modelWithDict:YourModel];
