//
//  ViewController.m
//  UI_UIGesture
//
//  Created by qianfeng on 15/7/9.
//  Copyright (c) 2015年 qianfeng32. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *imageNames = @[@"blue",@"red",@"yellow"];
    
    for (int i = 0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100*i, 50+100*i, 100, 100)];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        
        [self.view addSubview:imageView];
        
        //打开用户交互使能
        imageView.userInteractionEnabled = YES;
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesture)];
        
        //设置点击次数
        tap.numberOfTapsRequired = 1;
        
        //设置手指个数
        tap.numberOfTouchesRequired = 1;
        //给imageView添加手势
        [imageView addGestureRecognizer:tap];
        
        //添加长按手势
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture)];
        longPress.numberOfTapsRequired = 0;
        longPress.numberOfTouchesRequired = 1;
        [imageView addGestureRecognizer:longPress];
        
        
//        //添加移动手势
//        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
//        [imageView addGestureRecognizer:pan];
//        
//        
//        //捏合手势
//        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchGedture:)];
//        [imageView addGestureRecognizer:pinch];
//        
        
        //旋转手势
        UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(retationGesture:)];
        [imageView addGestureRecognizer:rotation];
        
        
        //清扫手势
        UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGesture:)];
        [imageView addGestureRecognizer:swip];
    }
    
    
}


- (void)tapgesture
{
    NSLog(@"图片被点击");
}


- (void)longPressGesture
{
    NSLog(@"长按手势被触发");
}


- (void)panGesture:(UIPanGestureRecognizer *)pan
{
    NSLog(@"移动手势被触发");
    UIView *view = pan.view;
    //获取手势偏移量
    CGPoint px = [pan translationInView:self.view];
    
    //设置偏移量为0
    [pan setTranslation:CGPointZero inView:self.view];
    
    if (pan.state == UIGestureRecognizerStateBegan || pan.state == UIGestureRecognizerStateChanged) {
    //改变手势对应的View的中心点坐标
    pan.view.center = CGPointMake(view.center.x+px.x, view.center.y+px.y);
 
    }
}



- (void)pinchGedture:(UIPinchGestureRecognizer *)pinch
{
    NSLog(@"捏合手势被触发");
   
    if (pinch.scale == UIGestureRecognizerStateBegan || pinch.scale == UIGestureRecognizerStateChanged) {
        pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
        //设置系数为1
    }

    pinch.scale = 1.0;
}




- (void)retationGesture:(UIRotationGestureRecognizer *)rotation
{
    NSLog(@"旋转手势被触发");
    if (rotation.state == UIGestureRecognizerStateBegan ||rotation.state == UIGestureRecognizerStateChanged) {

    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    rotation.rotation = 0;
    
   }
}



- (void)swipeGesture:(UISwipeGestureRecognizer *)swip
{
    NSLog(@"清扫手势被触发");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
