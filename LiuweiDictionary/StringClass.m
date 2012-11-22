//
//  StringClass.m
//  LiuweiDictionary
//
//  Created by liuwei on 12-11-11.
//  Copyright (c) 2012年 LIU WEI. All rights reserved.
//

#import "StringClass.h"

@implementation StringClass


-(const char *)UTF8String
{
    charClass *cc = [[[charClass alloc] init] autorelease];
    return cc.myChar;
}

@end
