//
//  XmlParse.h
//  WealthManagement
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 Shen.XS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XmlParse : NSObject

//返回某个节点的值
+ (NSArray *)parseWithXmlString:(NSString *)xmlString nodePath:(NSString *)nodePath;

//返回某个节点指定子节点的值
+ (NSArray *)parseWithXmlString:(NSString *)xmlString nodePath:(NSString *)nodePath nodeNames:(NSArray *)names;

@end
