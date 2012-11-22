//
//  FileOpPractise.m
//  LiuweiDictionary
//
//  Created by LIU WEI on 12-11-5.
//  Copyright (c) 2012年 LIU WEI. All rights reserved.
//

#import "FileOpPractise.h"

#import "AddressBook.h"
#import "NameCard.h"
#import "comAppDelegate.h"

@implementation FileOpPractise

-(void) lessonPractise
{
    //字符串相关文件操作
    
    NSArray* pathslw = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [pathslw objectAtIndex:0];
    NSLog(@"\ndocumentDir %@", documentDir);
    
    NSString *fileName = [documentDir stringByAppendingString:@"/string.txt"];
    
    NSString *aString = @"Hello, world";
    NSError *error = nil;
    
    BOOL b = [aString writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:&error];
    //NSString *bString = [NSString stringWithContentsOfFile:fileName encoding:NSASCIIStringEncoding error:&error];
    
    NSStringEncoding encode;
    //NSString *cStr = [NSString stringWithContentsOfFile:fileName usedEncoding:&encode error:&error];
    
    NSLog(@"success: %d", b);
    //NSLog(@"encode: %@", encode);
    NSLog(@"error: %@", error);
    NSLog(@"error code: %d", error.code);
    NSLog(@"error %@", [error localizedDescription]);
    
    //数组相关文件操作
    //尝试自定义对象
    //数组
    NSString *tmpStr = @"你好";  //NSData 存进去以后它做了编码，大致是把所有字符转化成asc字符
    NSData *tmpData = [tmpStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *aryFileName = [documentDir stringByAppendingString:@"Array.txt"];
    NSArray *ary = @[@"one", @"two", @"three", @"four", @"five", tmpData];
    [ary writeToFile:aryFileName atomically:YES];
    NSArray *ary2 = [NSArray arrayWithContentsOfFile:aryFileName];
    NSString *str2 = [NSString stringWithContentsOfFile:aryFileName encoding:NSUTF8StringEncoding error:&error];
    
    NSLog(@"array is: %@", ary2);
    NSLog(@"array in str is: %@", str2);
    
    NSLog(@"equal to %d", [tmpData isEqualToData:ary2[5]]);
    
    //数组里面是data
    //用字符串读出来
    
    //NSData
    unsigned char *f = "Xdddddd";
    NSString *dataFileName = [documentDir stringByAppendingString:@"data.txt"];
    NSData *data = [NSData dataWithBytes:(void *)f length:strlen(f)];
    [data writeToFile:dataFileName atomically:YES];
    
    //NSDictionary
    //        NSString *dicFileName = [documentDir stringByAppendingString:@"dic.txt"];
    //        NSArray *dic = @{@"one": @"key1", @"two":@"key2", @"three" : @"key3", @"four" : @"key4", @"five" : @"key5"};
    //        [ary writeToFile:dicFileName atomically:YES];
    //        NSDictionary *dic2 = [NSDictionary arrayWithContentsOfFile:aryFileName];
    
    NameCard *name1 = [[NameCard alloc] init];
    [name1 setName:@"Tom"];
    //[name1 setTel:@"18676656971"];
    [name1 setEmail:@"liuw79@gmail.com"];
    
    NameCard *name2 = [[NameCard alloc] init];
    [name2 setName:@"Jerry"];
    //[name2 setTel:@"00000000000"];
    [name2 setEmail:@"liutongfei22@gmail.com"];
    
    //用NSData
    NSString *namefileName = [documentDir stringByAppendingString:@"/name.txt"];
    NSData *nameData = [NSKeyedArchiver archivedDataWithRootObject:name1];
    [nameData writeToFile:namefileName atomically:YES];
    
    NSData *name1Dataout = [NSData dataWithContentsOfFile:namefileName];
    NameCard *name1out = [NSKeyedUnarchiver unarchiveObjectWithData:name1Dataout];
    NSLog(@"name 1: %@", name1out);
    
    //用数组
    NSArray *nameArray = @[name1, name2];
    //NSArray *nameArray = @[@"123", @"abc"];
    
    NSData *arrayData = [NSKeyedArchiver archivedDataWithRootObject:nameArray];
    NSLog(@"arrayData is: %@", arrayData);
    NSString *nameArrayfileName = [documentDir stringByAppendingString:@"/nameArray.txt"];
    NSLog(@"array to write: %@", nameArray);
    NSLog(@"array file to path:%@", nameArrayfileName);
    [arrayData writeToFile:nameArrayfileName atomically:YES];
    
    NSData  *nameDataOut = [NSData dataWithContentsOfFile:nameArrayfileName];
    NSLog(@"nameDataOut from file: %@", nameDataOut);
    
    NSArray *nameArrayOut = [NSKeyedUnarchiver unarchiveObjectWithData:nameDataOut];
    NSLog(@"name array out: %@", nameArrayOut);
    
    //用字典
    NSError *dicError;
    NSDictionary *nameDic = [NSDictionary dictionaryWithObjects:@[name1, name2] forKeys:@[@"n1", @"n2"]];
    NSLog(@"nameDic is:%@", nameDic);
    NSData *dicData = [NSPropertyListSerialization dataWithPropertyList:nameDic
                                                                 format:NSPropertyListXMLFormat_v1_0
                                                                options:NSPropertyListImmutable
                                                                  error:&dicError];
    
    NSLog(@"dic data is: %@", dicData);
    NSString *nameDicFilePath = [documentDir stringByAppendingString:@"/nameDic.txt"];
    [dicData writeToFile:nameDicFilePath atomically:YES];
    
    NSData *dicDataOut = [NSDictionary dictionaryWithContentsOfFile:nameDicFilePath];
    NSLog(@"dic data out: %@", dicDataOut);
    
    NSDictionary *nameDicOut = [NSDictionary dictionaryWithContentsOfFile:nameDicFilePath];
    NSLog(@"nameDic from file: %@", nameDicOut);
    
    
    [name1 release];
    [name2 release];
    
    NSLog(@"kNeuter %d", kNeuter);
    NSLog(@"kMale %d", kMale);
    NSLog(@"kFemale %d", kFemale);
    
}

@end
