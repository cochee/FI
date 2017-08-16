//
//  CMContact.m
//  FI
//
//  Created by zcm on 14/08/2017.
//  Copyright © 2017 zcm. All rights reserved.
//

#import "CMContact.h"

@implementation CMContact

- (NSString *)getName{
    return [NSString stringWithFormat:@"%@ %@",_lastName,_firstName];
}

- (CMContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber{
    if(self = [super init]){
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
    }
    return self;
}

+ (CMContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber{
    CMContact *contact = [[CMContact alloc]initWithFirstName:firstName andLastName:lastName andPhoneNumber:phoneNumber];
    return contact;
}

@end
