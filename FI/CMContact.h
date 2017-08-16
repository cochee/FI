//
//  CMContact.h
//  FI
//
//  Created by zcm on 14/08/2017.
//  Copyright © 2017 zcm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMContact : NSObject

@property(nonatomic,copy) NSString *firstName;

@property(nonatomic,copy) NSString *lastName;

@property(nonatomic,copy) NSString *phoneNumber;

- (CMContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *) phoneNumber;

- (NSString *)getName;


+ (CMContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *) phoneNumber;

@end
