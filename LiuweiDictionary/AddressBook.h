//
//  AddressBook.h
//  LiuweiDictionary
//
//  Created by LIU WEI on 12-11-3.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NameCard.h"

@interface AddressBook : NSObject
{
    NSDictionary * _dictAddressBook;
}

-(id) initAddressBookFromFile;

-(void) saveAddressBookToFile;

-(void) addNameCard:(NameCard *) nc;

-(void) lookUp:(NSString *) name;

-(void) lookUp:(NSString *) name byProperties:(NSSet *) proSet;

-(void) listAll;

-(void) listByGroup: (enum enumGroup) group;

@end