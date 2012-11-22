//
//  AddressBook.m
//  LiuweiDictionary
//
//  Created by LIU WEI on 12-11-3.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import "AddressBook.h"
#import "NameCard.h"

@implementation AddressBook

NSDictionary *_dictAddressBook;

//初始化通讯录，如有文件内容则读取
-(id) initAddressBookFromFile
{
    self = [super init];
    
    if (self)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDir = [paths objectAtIndex:0];
        NSString *fileName = [documentDir stringByAppendingString:@"/AddressBook.txt"];
        NSData *addressData = [NSData dataWithContentsOfFile:fileName];
        _dictAddressBook = [[NSKeyedUnarchiver unarchiveObjectWithData:addressData] retain];
    }
    
    return self;
}

//保存到文件
-(void) saveAddressBookToFile
{
    @autoreleasepool
    {
        //保存通讯录到文件
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDir = [paths objectAtIndex:0];
        NSString *fileName = [documentDir stringByAppendingString:@"/AddressBook.txt"];
        NSData *addressData = [NSKeyedArchiver archivedDataWithRootObject: _dictAddressBook];
        [addressData writeToFile:fileName atomically:YES];
    }
}

//新增一个联系人信息
-(void) addNameCard:(NameCard *) nc
{
    @autoreleasepool
    {
        //加入到字典
        NSMutableDictionary *_tempDic = [[[NSMutableDictionary alloc] initWithCapacity:15] autorelease];
        
        //获取已有资料
        if (_dictAddressBook)
        {
            [_tempDic addEntriesFromDictionary:_dictAddressBook];
        }
        //加入新联系人
        [_tempDic setObject:nc forKey:nc.name];
        
        //重新给本类的存储字典分配一个对象
        [_dictAddressBook release];
        _dictAddressBook = [_tempDic copy];
        
        //自动保存
        [self saveAddressBookToFile];
    }
}

//查找并打印联系人
-(void) lookUp:(NSString *) name
{
    @autoreleasepool
    {
        NameCard *nc = _dictAddressBook[name];
        
        if (nc)
        {
            NSDateFormatter *dateFmt = [[[NSDateFormatter alloc] init] autorelease];
            [dateFmt setDateFormat:@"yyyy-MM-dd"];
            
            NSLog(@"\n查找结果：姓名: %@，公司电话: %@， 家庭电话：%@，手机：%@，传真：%@，"\
                  "公司地址：%@，家庭地址：%@，EMail: %@，性别：%@，生日：%@",
                  nc.name, nc.telCom, nc.telHome, nc.mobile, nc.fax,
                  nc.addrCom, nc.addrHome, nc.email, nc.gender == 0? @"保密" : (nc.gender == 1 ? @"男" : @"女"),
                  [dateFmt stringFromDate: nc.birthday]);
        }
        else
        {
            NSLog(@"不存在的联系人：%@。", name);
        }
    }
}

//查找并打印联系人，指定属性
-(void) lookUp:(NSString *) name byProperties:(NSSet *) proSet
{
    @autoreleasepool
    {
        NameCard *nc = _dictAddressBook[name];
        
        
        NSDateFormatter *dateFmt = [[[NSDateFormatter alloc] init] autorelease];
        [dateFmt setDateFormat:@"yyyy-MM-dd"];
        
        NSMutableString *strLookUp = [NSMutableString stringWithCapacity:100];
        
        if (nc)
        {
            for (NSString *tmpName in proSet)
            {
                [strLookUp appendFormat:@"%@: %@  ", tmpName, [nc valueForKey:tmpName]];
            }
            
            NSLog(@"%@的指定资料：%@", name, strLookUp);
        }
        else
        {
            NSLog(@"不存在的联系人：%@。", name);
        }
    }
}

//列出所有联系人，按名字顺序
-(void) listAll
{
    @autoreleasepool
    {
        NSArray *namesArray = [[_dictAddressBook allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        
        NSLog(@"列出全部联系人：");
        for (NSString *name in namesArray)
        {
            NSLog(@"%@", _dictAddressBook[name]);
        }
    }
}

//按分组列出联系人
-(void) listByGroup:(enum enumGroup) group
{
    @autoreleasepool
    {
        NSSet *namesSet = [_dictAddressBook keysOfEntriesPassingTest:^BOOL(id key, id obj, BOOL *stop) {
            if ([obj group] == group)
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }];
        
        NSMutableArray *namesMArray = [NSMutableArray arrayWithCapacity:15];
        
        for (id aName in namesSet)
        {
            [namesMArray addObject:aName];
        }
        
        NSArray *namesArray = [[namesMArray copy] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];

        for (NSString *name in namesArray)
        {
            NSLog(@"Group %d:%@", group, _dictAddressBook[name]);
        }
        
    }
}

-(void)dealloc
{
    [_dictAddressBook release];
    _dictAddressBook = nil;
    
    [super dealloc];
}

@end










