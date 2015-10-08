//
//  XmlParse.m
//  WealthManagement
//
//  Created by rimi on 15/9/29.
//  Copyright (c) 2015年 Shen.XS. All rights reserved.
//

#import "XmlParse.h"
#import "GDataXMLNode.h"


@implementation XmlParse

// 返回某个节点的值
+(NSArray *)parseWithXmlString:(NSString *)xmlString nodePath:(NSString *)nodePath {
    NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:1];
    NSError *documentError = nil;
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithXMLString:xmlString options:0 error:&documentError];
    if (documentError) {
        NSString *errorString = [NSString stringWithFormat:@"document error:%@", documentError.localizedDescription];
        NSAssert(0, errorString);
    }
    
    //获取根节点
    GDataXMLElement *rootElement = [document rootElement];
    NSError *error = nil;
    NSArray *nodes = [rootElement nodesForXPath:nodePath error:&error];
    for (GDataXMLElement *aNode in nodes) {
        [resultArray addObject:[aNode stringValue]];
    }
    return resultArray;
}
// 返回某个节点指定子节点的值
+(NSArray *)parseWithXmlString:(NSString *)xmlString nodePath:(NSString *)nodePath nodeNames:(NSArray *)names {
    NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:1];
    NSError *documentError = nil;
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithXMLString:xmlString options:0 error:&documentError];
    if (documentError) {
        NSString *errorString = [NSString stringWithFormat:@"ducument error:%@", documentError.localizedDescription];
        NSAssert(0, errorString);
        return nil;
    }
    
    GDataXMLElement *rootElement = [document rootElement];
     NSError *error = nil;
     NSArray *nodes = [rootElement nodesForXPath:nodePath error:&error];
    for (GDataXMLElement *aNode in nodes) {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:names.count];
        
        for (int i = 0; i < names.count; i++) {
            NSString *nodeName = names[i];
            NSArray *childNodes = [aNode elementsForName:nodeName];
            NSString *valueString = [childNodes[0] stringValue];
            valueString = valueString == nil ? @"" : valueString;
            [dictionary setObject:valueString forKey:nodeName];
        }
        [resultArray addObject:dictionary];
    }
    return resultArray;
}

@end
