//
//  圆形进度条
//
//  Created by AEF_oycf on 2018/8/22.
//  Copyright © 2018年 AEF_oycf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLProgressView : UIView

@property (nonatomic, assign) CGFloat progressValue;// 进度

@property (nonatomic, strong) UIColor *trackColor;  // 轨道颜色
@property (nonatomic, assign) CGFloat trackWidth;   // 轨道宽度

@property (nonatomic, strong) UIColor *circleColor; // 进度条颜色
@property (nonatomic, assign) CGFloat circleWidth;  // 进度条宽度

@property (nonatomic, assign) BOOL isShowContent;   // 是否显示文本框
@property (nonatomic, strong) UIColor *contentColor;// 内容颜色
@property (nonatomic, strong) UIFont *contentFont;  // 内容字体
@property (nonatomic, copy) NSString *contentText;  // 内容


/*
 *  构造方法
 *  frame: 背景图的位置和宽高
 *  radius: 圆半径
 */
- (instancetype)initWithBackFrame:(CGRect)frame radius:(CGFloat)radius;

@end
