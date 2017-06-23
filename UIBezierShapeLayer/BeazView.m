//
//  BeazView.m
//  UIBezierShapeLayer
//
//  Created by 刘建明 on 17/6/2.
//  Copyright © 2017年 刘建明. All rights reserved.
//

#import "BeazView.h"
#import "UIView+Frame.h"

@interface BeazView ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong) UITableView *tableView;

@property (strong,nonatomic)UIView *shadowView;    //屏幕下方看不到的view

@property (nonatomic, weak) UIWindow *keyWindow; ///< 当前窗口
@property (nonatomic, assign) CGFloat windowWidth; ///< 窗口宽度
@property (nonatomic, assign) CGFloat windowHeight; ///< 窗口高度

@end
@implementation BeazView


#pragma mark - Public
+ (instancetype)popoverView {
    return [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //首先创建一个位于屏幕下方看不到的view
        UIView* shadowView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];

        UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [shadowView addGestureRecognizer:g];
        [self addSubview:shadowView];
        self.shadowView = shadowView;
        
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        
        UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
        
        effectview.frame =self.bounds;
        effectview.alpha = .8f;
        [self.shadowView addSubview:effectview];
    }
    return self;
}
-(void)showToView:(UIView *)pointView{
    
    
    _keyWindow = [UIApplication sharedApplication].keyWindow;
    _windowWidth = CGRectGetWidth(_keyWindow.bounds);
    _windowHeight = CGRectGetHeight(_keyWindow.bounds);
    
    CGRect pointViewRect = [pointView.superview convertRect:pointView.frame toView:_keyWindow];
    
    CGFloat pointViewUpLength = CGRectGetMinY(pointViewRect);
    
    CGFloat pointViewDownLength = _windowHeight - CGRectGetMaxY(pointViewRect);

    NSLog(@"%f---%f",_windowWidth,CGRectGetMaxX(pointViewRect));


    
    

    
    CGPoint toPoint = CGPointMake(CGRectGetMidX(pointViewRect), 0);
    NSLog(@"-----------%f---%f",toPoint.x,CGRectGetMidX(pointViewRect));

    _bezierPath4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50,CGRectGetMaxY(pointViewRect)+50, 200, 300) byRoundingCorners:UIRectCornerAllCorners
                                               cornerRadii:CGSizeMake(10, 10)];
    
    [_bezierPath4 moveToPoint:CGPointMake(toPoint.x, CGRectGetMaxY(pointViewRect)+35)];
    
    [_bezierPath4 addLineToPoint:CGPointMake(toPoint.x*6/8, CGRectGetMaxY(pointViewRect)+50)];
    
    [_bezierPath4 addLineToPoint:CGPointMake(toPoint.x*10/8, CGRectGetMaxY(pointViewRect)+50)];
    
    _shaperLayer4 = [CAShapeLayer new];
    _shaperLayer4.fillColor = [UIColor orangeColor].CGColor;
    [self.layer addSublayer:_shaperLayer4];
    _shaperLayer4.path = _bezierPath4.CGPath;
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(55,CGRectGetMaxY(pointViewRect)+55, 190, 290) style:UITableViewStylePlain];
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
   
    NSLog(@"132654");
    [self hide];
    
}
-(void)show{
    

    
    [UIView animateWithDuration:0.25f animations:^{
        [_keyWindow addSubview:self];
//        self.bgView.alpha = 1.0;


    }];
    

    
}
-(void)hide{
    
    [UIView animateWithDuration:0.02 animations:^{
//        self.bgView.alpha = 0.0;
        [self.shadowView removeFromSuperview];
        [self removeFromSuperview];
        
    } completion:^(BOOL finished) {
        
    }];
    
}
@end
