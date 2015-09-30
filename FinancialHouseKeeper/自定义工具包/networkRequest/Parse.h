//
//  Parse.h
//  URLDemo
//
//  Created by 杨琴 on 15/9/28.
//  Copyright (c) 2015年 yangqin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parse : NSObject

// 返回某个节点的值
- (NSArray *)parse:(NSString *)xmlString nodePath:(NSString *)nodePath;

// 返回某个节点指定子节点的值
- (NSArray *)parse:(NSString *)xmlString nodePath:(NSString *)nodePath nodeNames:(NSArray *)names;

@end
