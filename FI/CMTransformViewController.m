//
//  CMTransformViewController.m
//  FI
//
//  Created by zcm on 10/08/2017.
//  Copyright © 2017 zcm. All rights reserved.
//

#import "CMTransformViewController.h"

//定义rgb颜色
#define NORMAL_COLOR [UIColor colorWithRed:75/255.0 green:160/255.0 blue:253/255.0 alpha:1]
#define HIGHLIGHTED_COLOR [UIColor colorWithRed:197/255.0 green:221/225.0 blue:249/225.0 alpha:1]

//按钮操作
typedef void(^ ButtonHandle)();

@interface CMTransformViewController (){
    UIImageView *_imageView;
    UIButton *_btnRotation;
    UIButton *_btnScale;
    UIButton *_btnTranslate;
}

@end

@implementation CMTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addImageView];
    [self addRotationButton];
}


- (void)addImageView{
    UIImage *image = [UIImage imageNamed:@"banner"];
    _imageView = [[UIImageView alloc]initWithImage:image];
    _imageView.frame = CGRectMake(20, 20, 280, 150);
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
}

- (void)addRotationButton{
    _btnRotation = [self getButton];
    _btnRotation.frame = CGRectMake(20, 400, 280, 30);
    [_btnRotation setTitle:@"旋转" forState:UIControlStateNormal];
    [_btnRotation addTarget:self action:@selector(rotation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnRotation];
}

- (void)rotation:(UIButton *)btn{
    [self animation:^{
        CGFloat angle = M_PI_4;
        _imageView.transform=CGAffineTransformRotate(_imageView.transform, angle);
    }];
}

#pragma mark 动画执行方法，注意这里可以使用UIView的animateWithDuration方法代替这里只是为了演示
-(void)animation:(ButtonHandle)handle{
    //开始动画
    [UIView beginAnimations:@"animation" context:nil];
    //设置动画执行时间
    [UIView setAnimationDuration:0.5];
    
    handle();
    
    //执行动画操作
    [UIView commitAnimations];
    
}

#pragma mark 取得一个按钮,统一按钮样式
-(UIButton *)getButton{
    UIButton *button =[[UIButton alloc]init ];
    //设置正常状态下字体颜色
    [button setTitleColor:NORMAL_COLOR forState:UIControlStateNormal];
    //设置高亮状态下的字体颜色
    [button setTitleColor:HIGHLIGHTED_COLOR forState:UIControlStateHighlighted];
    return button;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
