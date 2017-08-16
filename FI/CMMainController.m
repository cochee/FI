//
//  CMMainController.m
//  FI
//
//  Created by zcm on 08/08/2017.
//  Copyright © 2017 zcm. All rights reserved.
//

#import "CMMainController.h"

@interface CMMainController(){
    UIButton *_btn;
}

@end


@implementation CMMainController

- (void)viewDidLoad{
    _btn = [[UIButton alloc]initWithFrame:CGRectMake(60, 100, 200, 50)];
    _btn.backgroundColor = [UIColor orangeColor];
    [_btn setTitle:@"Hello,World!" forState:UIControlStateNormal];
    _btn.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:_btn];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    NSLog(@"%@",NSStringFromCGRect(_btn.frame));
}

@end
