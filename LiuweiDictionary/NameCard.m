//
//  NameCard.m
//  LiuweiDictionary
//
//  Created by liuwei on 12-11-2.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import "NameCard.h"

@implementation NameCard

-(id) initWithName: (NSString *) name
         andTelCom:(NSString *)telCom  andTelHome:(NSString *)telHome andMobile:(NSString *)mobile andFax:(NSString *)fax
        andAddrCom:(NSString *)addrCom andAddrHome:(NSString *)addrHome andEmail:(NSString *)email
         andGender:(enum enumGender)gender andBirthday:(NSDate *)birthday
          andGroup:(enum enumGroup)group
{
    self = [super init];
    
    if(self)
    {
        [self setValue:name forKey:@"name"];
        [self setValue:telCom forKey:@"telCom"];
        [self setValue:telHome forKey:@"telHome"];
        [self setValue:mobile forKey:@"mobile"];
        [self setValue:fax forKey:@"fax"];
        [self setValue:addrCom forKey:@"addrCom"];
        [self setValue:addrHome forKey:@"addrHome"];
        [self setValue:email forKey:@"email"];
        [self setValue:[NSNumber numberWithInt:gender] forKey:@"gender"];
        [self setValue:birthday forKey:@"birthday"];
        [self setValue:[NSNumber numberWithInt:group] forKey:@"group"];
        [self setValue:[self getAge:_birthday] forKey:@"age"];
    }
    
    return self;
}

-(void) encodeWithCoder:(NSCoder *) encoder
{
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.telCom forKey:@"telCom"];
    [encoder encodeObject:self.telHome forKey:@"telHome"];
    [encoder encodeObject:self.mobile forKey:@"mobile"];
    [encoder encodeObject:self.fax forKey:@"fax"];
    [encoder encodeObject:self.addrCom forKey:@"addrCom"];
    [encoder encodeObject:self.addrHome forKey:@"addrHome"];
    [encoder encodeObject:self.email forKey:@"email"];
    [encoder encodeInt32:self.gender forKey:@"gender"];
    [encoder encodeObject:self.birthday forKey:@"birthday"];
    [encoder encodeInt32:self.group forKey:@"group"];
    [encoder encodeInt32:self.age forKey:@"age"];
}

-(id) initWithCoder:(NSCoder *) decoder
{
    self = [super init];
    
    if(self)
    {
        _name = [[decoder decodeObjectForKey:@"name"] retain];
        _telCom  = [[decoder decodeObjectForKey:@"telCom"] retain];
        _telHome = [[decoder decodeObjectForKey:@"telHome"] retain];
        _mobile = [[decoder decodeObjectForKey:@"mobile"] retain];
        _fax = [[decoder decodeObjectForKey:@"fax"] retain];
        _addrCom = [[decoder decodeObjectForKey:@"addrCom"] retain];
        _addrHome  = [[decoder decodeObjectForKey:@"addrHome"] retain];
        _email = [[decoder decodeObjectForKey:@"email"] retain];
        _gender = [decoder decodeInt32ForKey:@"gender"];
        _birthday = [[decoder decodeObjectForKey:@"birthday"] retain];
        _group = [decoder decodeInt32ForKey:@"group"];
        _age = [decoder decodeInt32ForKey:@"age"];
    }
    
    return self;
}

//打印对象内容
- (NSString *)description
{
    NSDateFormatter *dateFmt = [[[NSDateFormatter alloc] init] autorelease];
    [dateFmt setDateFormat:@"yyyy-MM-dd"];
    
    NSString *str = [NSString stringWithFormat:
                     @"姓名: %@，公司电话: %@， 家庭电话：%@，手机：%@，传真：%@，"\
                     "公司地址：%@，家庭地址：%@，EMail: %@，性别：%@，生日：%@，年龄：%d",
                     self.name, self.telCom, self.telHome, self.mobile, self.fax,
                     self.addrCom, self.addrHome, self.email, self.gender == 0? @"保密" : (self.gender == 1 ? @"男" : @"女"),
                     [dateFmt stringFromDate: self.birthday],
                     self.age];
    
    return str;
}


- (void)dealloc
{
    [_name release];
    _name = nil;
    
    [_telCom release];
    _telCom = nil;
    
    [_telHome release];
    _telHome = nil;
    
    [_mobile release];
    _mobile = nil;
    
    [_fax release];
    _fax = nil;
    
    [_addrCom release];
    _addrCom = nil;
    
    [_addrHome release];
    _addrHome = nil;
    
    [_email release];
    _email = nil;
    
    [_birthday release];
    _birthday = nil;
    
    [super dealloc];
}

-(NSNumber *) getAge:(NSDate *) date
{
    //计算年龄
    NSDate *dateNow = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSCalendar *gregorian = [[[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSUInteger unitFlags = NSYearCalendarUnit;
    
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:date
                                                  toDate:dateNow options:0];
    NSUInteger year = [components year];
    
    return [NSNumber numberWithUnsignedInteger:year];
}

@end
