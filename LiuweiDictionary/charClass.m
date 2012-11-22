//
//  charClass.m
//  LiuweiDictionary
//
//  Created by liuwei on 12-11-11.
//  Copyright (c) 2012年 LIU WEI. All rights reserved.
//

#import "charClass.h"

@implementation charClass

-(id) init
{
    self = [super init];
    _myChar = malloc(1024);
    return self;
}

-(void)dealloc
{
    free((void *) _myChar);
    
    [super dealloc];
}

@end
