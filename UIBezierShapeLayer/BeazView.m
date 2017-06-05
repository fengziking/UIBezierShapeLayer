//
//  BeazView.m
//  UIBezierShapeLayer
//
//  Created by 刘建明 on 17/6/2.
//  Copyright © 2017年 刘建明. All rights reserved.
//

#import "BeazView.h"

@interface BeazView ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong) UITableView *tableView;

@property (strong,nonatomic)UIView *bgView;    //屏幕下方看不到的view


@end
@implementation BeazView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self dosomething];
    }
    return self;
}
-(void)dosomething{
    
      UIView* bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.45];
//    bgView.alpha = 0.0f;
    UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [bgView addGestureRecognizer:g];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:bgView];
    self.bgView = bgView;
    
//    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, bgView.frame.size.width, bgView.frame.size.height)];
//    toolbar.barStyle = UIBarStyleDefault;
//    [bgView addSubview:toolbar];
    
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    effectview.frame = CGRectMake(0, 0, bgView.frame.size.width, bgView.frame.size.height);
    [self.bgView addSubview:effectview];
    
    
    _bezierPath4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 20, self.frame.size.width, 100) byRoundingCorners:UIRectCornerAllCorners
                                              cornerRadii:CGSizeMake(10, 10)];
    [_bezierPath4 moveToPoint:CGPointMake(80, 0)];
    [_bezierPath4 addLineToPoint:CGPointMake(60, 20)];
    [_bezierPath4 addLineToPoint:CGPointMake(100, 20)];
    
    _shaperLayer4 = [CAShapeLayer new];
    _shaperLayer4.fillColor = [UIColor orangeColor].CGColor;
    [self.layer addSublayer:_shaperLayer4];
    _shaperLayer4.path = _bezierPath4.CGPath;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 20,self.frame.size.width-20, 100) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = YES;
    _tableView.showsVerticalScrollIndicator = YES;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:_tableView];
    


    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor clearColor];

    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.stringBlock([NSString stringWithFormat:@"%ld",(long)indexPath.row]);
    [self hide];
    
}
-(void)tap{
    
    [self hide];
}
-(void)show{
    

     self.transform = CGAffineTransformMakeScale(1, 1);
    
    [UIView animateWithDuration:0.25f animations:^{
        self.transform = CGAffineTransformIdentity;
        [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
        self.bgView.alpha = 1.0;


    }];
    

    
}
-(void)hide{
    
    [UIView animateWithDuration:0.02 animations:^{
        self.bgView.alpha = 0.0;
        [self.bgView removeFromSuperview];
        [self removeFromSuperview];
        
    } completion:^(BOOL finished) {
        
    }];
    
}
@end
