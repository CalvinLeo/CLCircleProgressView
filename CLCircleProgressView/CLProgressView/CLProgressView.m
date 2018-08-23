//
//  圆形进度条
//
//  Created by AEF_oycf on 2018/8/22.
//  Copyright © 2018年 AEF_oycf. All rights reserved.
//

#import "CLProgressView.h"

@interface CLProgressView ()

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, strong) CAShapeLayer *backLayer;  // 背景图层
@property (nonatomic, strong) CAShapeLayer *frontLayer; // 前面展示的图层
@property (nonatomic, strong) UILabel *textLabel;       // 内容视图

@end

@implementation CLProgressView

- (instancetype)initWithBackFrame:(CGRect)frame radius:(CGFloat)radius;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.radius = radius;
        [self configUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI
{
    // 背景圆环
    self.backLayer = [CAShapeLayer layer];
    
    CGPoint center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:self.radius startAngle:-0.5 * M_PI endAngle:2 * M_PI - 0.5 * M_PI clockwise:YES];
//    UIBezierPath *backPath = [UIBezierPath bezierPathWithArcCenter:center radius:self.radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    // 轨道圆
    self.backLayer.strokeColor = [UIColor grayColor].CGColor;
    self.backLayer.fillColor = [UIColor clearColor].CGColor;
    self.backLayer.path = path.CGPath;
    self.backLayer.lineWidth = 5;
    self.backLayer.lineCap = kCALineCapRound;
    self.backLayer.lineJoin = kCALineJoinRound;
    
    // 滚动条
    self.frontLayer = [CAShapeLayer layer];
    

    self.frontLayer.path = path.CGPath;
    self.frontLayer.lineWidth = 6;
    self.frontLayer.strokeColor = [UIColor redColor].CGColor;
    self.frontLayer.fillColor = [UIColor clearColor].CGColor;
    self.frontLayer.lineCap = kCALineCapRound;
    self.frontLayer.lineJoin = kCALineJoinRound;
    self.frontLayer.strokeStart = 0.0;
    self.frontLayer.strokeEnd = 0.0;
    
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.textLabel.font = [UIFont systemFontOfSize:15];
    self.textLabel.textColor = [UIColor orangeColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:self.textLabel];
    [self.layer addSublayer:self.backLayer];
    [self.layer addSublayer:self.frontLayer];
}

#pragma mark - Setter
// 设置滚动条数值
- (void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;
    self.frontLayer.strokeEnd = progressValue;
}

// 设置轨道颜色
- (void)setTrackColor:(UIColor *)trackColor
{
    _trackColor = trackColor;
    self.backLayer.strokeColor = trackColor.CGColor;
}

// 设置轨道的宽度
- (void)setTrackWidth:(CGFloat)trackWidth
{
    _trackWidth = trackWidth;
    self.backLayer.lineWidth = trackWidth;
}

// 设置滚动条数值
- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    self.frontLayer.strokeColor = circleColor.CGColor;
}

// 设置滚动条线宽
- (void)setCircleWidth:(CGFloat)circleWidth
{
    _circleWidth = circleWidth;
    self.frontLayer.lineWidth = circleWidth;
}

// 设置内容文字
- (void)setContentText:(NSString *)contentText
{
    _contentText = contentText;
    self.textLabel.text = contentText;
}

// 设置内容颜色
- (void)setContentColor:(UIColor *)contentColor
{
    _contentColor = contentColor;
    self.textLabel.textColor = contentColor;
}

// 设置字体
- (void)setContentFont:(UIFont *)contentFont
{
    _contentFont = contentFont;
    self.textLabel.font = contentFont;
}

// 显示或隐藏文本框
- (void)setIsShowContent:(BOOL)isShowContent
{
    _isShowContent = isShowContent;
    self.textLabel.hidden = !isShowContent;
}

@end
