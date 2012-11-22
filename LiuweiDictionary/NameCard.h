//
//  NameCard.h
//  LiuweiDictionary
//
//  Created by liuwei on 12-11-2.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

enum enumGender
{
    kNeuter = 0,  //保密
    kMale = 1,      //男
    kFemale = 2    //女
};

enum enumGroup
{
    kFamily = 0,
    kCompany = 1,
    kFriend = 2,
    kClassMate = 3,
    kCustomer = 4,
    kOthers = 5,
    kCustom01 = 6,
    kCustom02 = 7
};

@interface NameCard : NSObject<NSCoding>

@property (nonatomic, retain) NSString *name; //姓名
@property (nonatomic, retain) NSString *telCom, *telHome, *mobile, *fax;  //电话
@property (nonatomic, retain) NSString *addrCom, *addrHome, *email;  //地址
@property enum enumGender gender;  //性别
@property (nonatomic, retain) NSDate *birthday;
@property enum enumGroup group;  //分组
@property uint age;

-(id) initWithName: (NSString *) name
         andTelCom: (NSString *) telCom
        andTelHome: (NSString *) telHome
         andMobile: (NSString *) mobile
            andFax: (NSString *) fax
                andAddrCom: (NSString *) addrCom
       andAddrHome: (NSString *) addrHome
                andEmail: (NSString *) email
             andGender: (enum enumGender) gender
            andBirthday:(NSDate *) birthday
          andGroup: (enum enumGroup) group;

-(NSNumber *) getAge: (NSDate *) date;  //计算年龄

@end
