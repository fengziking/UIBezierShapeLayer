//
//  ViewController.m
//  UIBezierShapeLayer
//
//  Created by 刘建明 on 17/6/2.
//  Copyright © 2017年 刘建明. All rights reserved.
//

#import "ViewController.h"
#import "BeazView.h"
@interface ViewController (){
    UIBezierPath *bezierPath4;
    CAShapeLayer *shaperLayer4;
    UILabel *title ;
    
    BeazView *view;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //圆
    CAShapeLayer *shapeLayer = [CAShapeLayer new];
    shapeLayer.fillColor = [UIColor redColor].CGColor; //填充颜色
  //  [self.view.layer addSublayer:shapeLayer];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.frame.size.width/2, 75) radius:40 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    shapeLayer.path = bezierPath.CGPath;
    
    //圆环
    CAShapeLayer *shapeLayer1 = [CAShapeLayer new];
    shapeLayer1.fillColor = [UIColor whiteColor].CGColor; //填充颜色
    shapeLayer1.strokeColor = [UIColor redColor].CGColor; //边框颜色
    shapeLayer1.lineWidth = 20.0f; //边框的宽度
   // [self.view.layer insertSublayer:shapeLayer1 atIndex:0];
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.frame.size.width/2, 150) radius:80 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    shapeLayer1.path = bezierPath1.CGPath;
    
    //、任意形状
    CAShapeLayer *shapeLayer2 = [CAShapeLayer new];
    shapeLayer2.fillColor = [UIColor redColor].CGColor; //填充颜色
   // [self.view.layer insertSublayer:shapeLayer2 atIndex:1];
    UIBezierPath *bezierPath2 = [UIBezierPath new];
    [bezierPath2 moveToPoint:CGPointMake(50, 50)];
    [bezierPath2 addLineToPoint:CGPointMake(250, 50)];
    [bezierPath2 addLineToPoint:CGPointMake(250, 200)];
    [bezierPath2 addLineToPoint:CGPointMake(100, 250)];
    [bezierPath2 closePath];//将起点与结束点相连接
    shapeLayer2.path = bezierPath2.CGPath;
    
    //倒圆角
    UIBezierPath *bezierPath3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 300, self.view.frame.size.width-20, 100) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *shaperLayer3 = [CAShapeLayer new];
    shaperLayer3.fillColor = [UIColor orangeColor].CGColor;
   // [self.view.layer insertSublayer:shaperLayer3 atIndex:2];
    shaperLayer3.path = bezierPath3.CGPath;
    
    
    
    //画箭头
  // [self.view addSubview:view];
    
//    bezierPath4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 500, self.view.frame.size.width-20, 100) byRoundingCorners:UIRectCornerAllCorners
//                                                               cornerRadii:CGSizeMake(10, 10)];
//    [bezierPath4 moveToPoint:CGPointMake(100, 460)];
//    [bezierPath4 addLineToPoint:CGPointMake(80, 500)];
//    [bezierPath4 addLineToPoint:CGPointMake(120, 500)];
//    
//    shaperLayer4 = [CAShapeLayer new];
//    shaperLayer4.fillColor = [UIColor orangeColor].CGColor;
//    [self.view.layer addSublayer:shaperLayer4];
//
//    shaperLayer4.path = bezierPath4.CGPath;
//
//    title = [[UILabel alloc]initWithFrame:CGRectMake(10, 500, self.view.frame.size.width-20, 100)];
//    title.text = @"我在上面";
//    title.textColor = [UIColor redColor];
//    [self.view addSubview:title];
    
    UIButton *btn = [UIButton new];
    btn.frame =CGRectMake(10, 150, self.view.frame.size.width-20, 100);
    [btn setTitle:@"点一点" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    btn.backgroundColor = [UIColor purpleColor];
    [btn addTarget:self action:@selector(clcik) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    
}
-(void)clcik1{
    
    
    NSLog(@"13213");
    
    
}
-(void)clcik{
    view = [[BeazView alloc]initWithFrame:CGRectMake(10, 500, self.view.frame.size.width-20, 120)];
    view.stringBlock= ^(NSString *strig){
        NSLog(@"strig-------%@",strig);
    };
    
    [view show];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
