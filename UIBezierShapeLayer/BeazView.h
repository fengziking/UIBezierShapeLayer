//
//  BeazView.h
//  UIBezierShapeLayer
//
//  Created by 刘建明 on 17/6/2.
//  Copyright © 2017年 刘建明. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^clickStringBlock)(NSString * string);

@interface BeazView : UIView

@property(strong,nonatomic)UIBezierPath *bezierPath4;

@property(strong,nonatomic)CAShapeLayer *shaperLayer4;

@property(strong,nonatomic)UILabel *title ;
;



@property (nonatomic,copy) clickStringBlock stringBlock;


-(void)hide;

-(void)show;

@end
