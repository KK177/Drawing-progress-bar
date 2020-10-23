//
//  StepProgressView.m
//  进度条
//
//  Created by MacBook pro on 2020/10/20.
//  Copyright © 2020 MacBook pro. All rights reserved.
//

#import "StepProgressView.h"

#define leftSpace 25
#define lineH 4
#define smallH 12
#define bigH 16
#define CGRect(f)  CGRectMake(leftSpace- f/2 + i * avaWidth, (height -f)/2, f, f)

@interface StepProgressView()


@end

@implementation StepProgressView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.lineColor = [UIColor lightGrayColor];
        self.stepedLineColor = [UIColor redColor];
        self.stepColor = [UIColor lightGrayColor];
        self.currentStepColor = [UIColor redColor];
        self.stepedColor = [UIColor redColor];
        self.titleColor = [UIColor darkTextColor];
        self.currentTitleColor = [UIColor redColor];
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
}

- (void)setIndex:(NSInteger)index{
    _index = index;
     [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
}

- (void)setStepedLineColor:(UIColor *)stepedLineColor{
    _stepedLineColor = stepedLineColor;
}

- (void)setCurrentStepColor:(UIColor *)currentStepColor{
    _currentStepColor = currentStepColor;
}

- (void)setStepedColor:(UIColor *)stepedColor{
    _stepedColor = stepedColor;
}

- (void)setStepColor:(UIColor *)stepColor{
    _stepColor = stepColor;
}

- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
}

- (void)setCurrentTitleColor:(UIColor *)currentTitleColor{
    _currentTitleColor = currentTitleColor;
}
//画线
- (void)drawRect:(CGRect)rect{
    CGFloat height = rect.size.height;
    CGFloat width = rect.size.width;

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.lineColor.CGColor);
    CGContextFillRect(context, CGRectMake(leftSpace, (height - lineH)/2, width-2 *leftSpace , lineH));
    
    UIColor *color = self.stepedLineColor != nil?self.stepedLineColor : self.currentStepColor;
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(leftSpace, (height - lineH)/2, (width-2 *leftSpace)*self.index/self.titleArray.count+self.index*smallH*2+bigH/2 , lineH));

    [self drawCircle];
    [self drawLabel];
}

//画圆
-(void)drawCircle
{
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
 
    CGFloat circleWidth = width - 2* leftSpace;
    CGFloat avaWidth = circleWidth /(self.titleArray.count -1);
    
    for (int i =0; i< self.titleArray.count; i++) {
        if (i == self.index) {
            [self FillPathWithRect:CGRect(bigH) fillColor:self.currentStepColor]; //绘制大圆
        }
        else if(i < self.index){
            [self FillPathWithRect:CGRect(smallH) fillColor:self.stepedColor];
        }
        else{
            [self FillPathWithRect:CGRect(smallH) fillColor:self.stepColor];
        }
    }
}

-(void)FillPathWithRect:(CGRect) rect fillColor:(UIColor *)fillColor{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextAddEllipseInRect(context, rect);
    CGContextFillPath(context);
}
//画文字
-(void)drawLabel
{
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    CGFloat circleWidth = width - 2* leftSpace;
    
    CGFloat avaWidth = circleWidth /(self.titleArray.count -1);
    
    for (int i = 0; i<self.titleArray.count; i++) {
        
        UIColor *titleColor;
        if (i == self.index) {
            titleColor = self.currentTitleColor != nil ? self.currentTitleColor : self.currentStepColor;
        }else{
            titleColor = self.titleColor;
        }
        NSAttributedString *attStr =[[NSAttributedString alloc]initWithString:self.titleArray[i] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:titleColor}];
        CGPoint point = CGPointMake(leftSpace +avaWidth *i-attStr.size.width/2, height/2 +bigH/2+1);
        [attStr drawAtPoint:point];
    }
}
@end


