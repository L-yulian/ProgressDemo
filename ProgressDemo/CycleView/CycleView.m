//
//  CycleView.m
//  Practice
//
//  Created by 杨广军 on 2017/7/21.
//  Copyright © 2017年 杨广军. All rights reserved.
//

#import "CycleView.h"

@implementation CycleView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CALayer *gradientLayer = [CALayer layer];
        
        //左侧渐变色
        CAGradientLayer *leftLayer = [CAGradientLayer layer];
        leftLayer.frame = CGRectMake(0, 0, frame.size.width/2, frame.size.height);
        leftLayer.locations = @[@0.2, @0.5, @1];
        leftLayer.colors = @[(id)[UIColor yellowColor].CGColor,(id)[UIColor blueColor].CGColor, (id)[UIColor greenColor].CGColor];
        [gradientLayer addSublayer:leftLayer];
        
        //右侧渐变色
        CAGradientLayer *rightLayer = [CAGradientLayer layer];
        rightLayer.frame = CGRectMake(self.bounds.size.width / 2, 0, self.bounds.size.width / 2, self.bounds.size.height);
        rightLayer.locations = @[@0.3, @0.9, @1];
        rightLayer.colors = @[(id)[UIColor orangeColor].CGColor, (id)[UIColor redColor].CGColor];
        [gradientLayer addSublayer:rightLayer];
        [self.layer addSublayer:gradientLayer];
        _gradientLayer = gradientLayer;
        
        //获取环形路径（画一个圆形，填充色透明，设置线框宽度为10，这样就获得了一个环形）
        _progressLayer = [CAShapeLayer layer];//创建一个track shape layer
        _progressLayer.frame = self.bounds;
        _progressLayer.fillColor = [[UIColor clearColor] CGColor];  //填充色为无色
        _progressLayer.strokeColor = [[UIColor redColor] CGColor]; //指定path的渲染颜色,这里可以设置任意不透明颜色
        _progressLayer.opacity = 1; //背景颜色的透明度
//        _progressLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
        _progressLayer.lineWidth = 10;//线的宽度
        [self.layer addSublayer:_progressLayer];
        _radius = 85; //半径
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    /**************************普通环形进度条(不需要initWithFrame方法)*************************/
    
//    CGContextRef ctf = UIGraphicsGetCurrentContext();
//    
//    CGPoint center = CGPointMake(100, 100);
//    CGFloat radius = 90;
//    CGFloat startA = - M_PI_2;
//    CGFloat endA = - M_PI_2 + M_PI*2*_progress;
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
//    CGContextSetLineWidth(ctf, 10);
//    [[UIColor blueColor] setStroke];
//    
//    CGContextAddPath(ctf, path.CGPath);
//    CGContextStrokePath(ctf);
    
    
    /********************渐变形状绘制***************************************/
    
    CGPoint center = CGPointMake(100, 100);
    
    CGFloat startA = - M_PI_2;  //设置进度条起点位置
    CGFloat endA = -M_PI_2 + M_PI * 2 * _progress;  //设置进度条终点位置
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:_radius startAngle:startA endAngle:endA clockwise:YES];//上面说明过了用来构建圆形
    _progressLayer.path =[path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。

    [_gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
    
    
}

- (void)drawProgress:(CGFloat)progress{
    _progress = progress;
    [self setNeedsDisplay];
}


@end
