//
//  StepProgressView.h
//  进度条
//
//  Created by MacBook pro on 2020/10/20.
//  Copyright © 2020 MacBook pro. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StepProgressView : UIView
/*
 线的颜色
 */
@property(nonatomic,strong)UIColor *lineColor;
/*
 已经执行线的颜色
 */
@property(nonatomic,strong)UIColor *stepedLineColor;
/*
当前步骤圆的颜色
*/
@property(nonatomic,strong)UIColor *currentStepColor;
/*
圆的颜色
*/
@property(nonatomic,strong)UIColor *stepedColor;
/*
圆的颜色
*/
@property(nonatomic,strong)UIColor *stepColor;
/*
文字颜色
*/
@property(nonatomic,strong)UIColor *titleColor;
/*
当前步骤文字颜色
*/
@property(nonatomic,strong)UIColor *currentTitleColor;

@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,assign)NSInteger index; //确定哪个状态


@end
