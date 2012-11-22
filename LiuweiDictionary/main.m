//
//  main.m
//  LiuweiDictionary
//
//  Created by liuwei on 12-11-2.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AddressBook.h"
#import "NameCard.h"
#import "comAppDelegate.h"
#import "StringClass.h"

int main(int argc, char *argv[])
{
    @autoreleasepool
    {
        
        NSDateFormatter *dateFmt = [[[NSDateFormatter alloc] init] autorelease];
        [dateFmt setDateFormat:@"yyyy-MM-dd"];
        NSDate *date1 = [dateFmt dateFromString:@"1990-10-1"];
        NSDate *date2 = [dateFmt dateFromString:@"1992-9-10"];
        
        @autoreleasepool
        {
            AddressBook *addressBook = [[AddressBook alloc] initAddressBookFromFile];
            
            //做一个至少15个联系人的通讯录
            NameCard *nc01 = [[[NameCard alloc] initWithName:@"Tom" andTelCom:@"8888" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kMale andBirthday:date1 andGroup:kFamily] autorelease];
            NameCard *nc02 = [[[NameCard alloc] initWithName:@"Jerry" andTelCom:@"6666" andTelHome:@"7777" andMobile:@"1222" andFax:@"8822" andAddrCom:@"addrCom2" andAddrHome:@"addrHome2" andEmail:@"tom@yahoo.com" andGender:kNeuter andBirthday:date1 andGroup:kFamily] autorelease];
            NameCard *nc03 = [[[NameCard alloc] initWithName:@"Marry" andTelCom:@"8888" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kFemale andBirthday:date1 andGroup:kClassMate] autorelease];
            NameCard *nc04 = [[[NameCard alloc] initWithName:@"Jack" andTelCom:@"8888" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kMale andBirthday:date1 andGroup:kCompany] autorelease];
            NameCard *nc05 = [[[NameCard alloc] initWithName:@"Obama" andTelCom:@"8888" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kMale andBirthday:date1 andGroup:kCompany] autorelease];
            NameCard *nc06 = [[[NameCard alloc] initWithName:@"DDD" andTelCom:@"8888" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kNeuter andBirthday:date1 andGroup:kCompany] autorelease];
            NameCard *nc07 = [[[NameCard alloc] initWithName:@"EEE" andTelCom:@"8888" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kNeuter andBirthday:date2 andGroup:kFamily] autorelease];
            NameCard *nc08 = [[[NameCard alloc] initWithName:@"FFF" andTelCom:@"8888" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kFemale andBirthday:date2 andGroup:kFamily] autorelease];
            NameCard *nc09 = [[[NameCard alloc] initWithName:@"GGG" andTelCom:@"8888" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kMale andBirthday:date2 andGroup:kFamily] autorelease];
            NameCard *nc10 = [[[NameCard alloc] initWithName:@"张一" andTelCom:@"三里屯" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kFemale andBirthday:date1 andGroup:kFamily] autorelease];
            NameCard *nc11 = [[[NameCard alloc] initWithName:@"孙二" andTelCom:@"东门" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kFemale andBirthday:date2 andGroup:kCompany] autorelease];
            NameCard *nc12 = [[[NameCard alloc] initWithName:@"王三" andTelCom:@"华强北" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kFemale andBirthday:date1 andGroup:kFriend] autorelease];
            NameCard *nc13 = [[[NameCard alloc] initWithName:@"赵四" andTelCom:@"象牙山村" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kMale andBirthday:date1 andGroup:kFriend] autorelease];
            NameCard *nc14 = [[[NameCard alloc] initWithName:@"李五" andTelCom:@"前海" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kMale andBirthday:date2 andGroup:kFriend] autorelease];
            NameCard *nc15 = [[[NameCard alloc] initWithName:@"陈六" andTelCom:@"科技园" andTelHome:@"8882" andMobile:@"1333" andFax:@"8822" andAddrCom:@"addrCom1" andAddrHome:@"addrHome1" andEmail:@"tom@yahoo.com" andGender:kMale andBirthday:date2 andGroup:kCompany] autorelease];
            
            //加入通讯录
            //
            [addressBook addNameCard:nc01];
            [addressBook addNameCard:nc02];
            [addressBook addNameCard:nc03];
            [addressBook addNameCard:nc04];
            [addressBook addNameCard:nc05];
            [addressBook addNameCard:nc06];
            [addressBook addNameCard:nc07];
            [addressBook addNameCard:nc08];
            [addressBook addNameCard:nc09];
            [addressBook addNameCard:nc10];
            [addressBook addNameCard:nc11];
            [addressBook addNameCard:nc12];
            [addressBook addNameCard:nc13];
            [addressBook addNameCard:nc14];
            [addressBook addNameCard:nc15];
            
            //释放
            [addressBook release];
            addressBook = nil;
        }
        
        //从文件读取通讯录
        AddressBook *addressBookQuery = [[AddressBook alloc] initAddressBookFromFile];
        
        //查询联系人
        [addressBookQuery lookUp:@"Tom"];
        [addressBookQuery lookUp:@"李五"];
        
        //从小到大列出所有联系人
        [addressBookQuery listAll];
        
        //列出某个分组的联系人
        [addressBookQuery listByGroup:kFamily];
        
        //按选择的字段打印
        NSSet * tmpSet = [NSSet setWithObjects:@"name", @"mobile", @"email", nil];
        [addressBookQuery lookUp:@"赵四" byProperties:tmpSet];
        
        //释放
        [addressBookQuery release];
        addressBookQuery = nil;
        
        
//        //(const char *) UTF8String  //返回一个utf8编码的C指针，返回的是个autorelease的，c的autorelease是怎么实现的？它不是对象。怎么处理这个问题？
//        //怎么返回一个像autorelease一样可以自动释放的东西
//        const char *cchar;
//        @autoreleasepool {
//            StringClass *strcls = [[[StringClass alloc] init] autorelease];
//            cchar = [strcls UTF8String];
//        }
//        free(cchar);
        
    }
    
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([comAppDelegate class]));
}



