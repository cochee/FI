//
//  CMContactGroup.m
//  FI
//
//  Created by zcm on 14/08/2017.
//  Copyright © 2017 zcm. All rights reserved.
//

#import "CMContactGroup.h"

@implementation CMContactGroup
-(CMContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    if (self=[super init]) {
        self.name=name;
        self.detail=detail;
        self.contacts=contacts;
    }
    return self;
}

+(CMContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    CMContactGroup *group1=[[CMContactGroup alloc]initWithName:name andDetail:detail andContacts:contacts];
    return group1;
}
@end
