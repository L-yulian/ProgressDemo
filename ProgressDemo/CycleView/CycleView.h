//
//  CycleView.h
//  Practice
//
//  Created by 杨广军 on 2017/7/21.
//  Copyright © 2017年 杨广军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CycleView : UIView
//渐变进度
@property (nonatomic, assign) CGFloat progress;
//渐变layer
@property (nonatomic, strong) CALayer *gradientLayer;
//圆环半径
@property (nonatomic, assign) CGFloat radius;
//显示渐变圆环layer
@property (nonatomic, strong) CAShapeLayer *progressLayer;
- (void)drawProgress:(CGFloat)progress;



@end
