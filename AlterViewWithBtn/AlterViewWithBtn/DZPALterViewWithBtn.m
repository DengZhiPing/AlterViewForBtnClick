//
//  DZPALterViewWithBtn.m
//  AlterViewWithBtn
//
//  Created by dengzhiping on 16/6/21.
//  Copyright © 2016年 dengzhiping. All rights reserved.
//

#import "DZPALterViewWithBtn.h"
#import "PureLayout.h"

#define KScreen_W     [UIScreen mainScreen].bounds.size.width
#define KScreen_H     [UIScreen mainScreen].bounds.size.height

static const NSUInteger BtnTag = 100;

static const CGFloat VIEW_W = 180.0;
static const CGFloat VIEW_H = 120.0;

@implementation DZPALterViewWithBtn
- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.viewWidth                  =   VIEW_W;
        self.viewHeight                 =   VIEW_H;
        self.textFont                   =   18.0;
        self.titleTextColor             =   [UIColor whiteColor];
        self.viewBackGroundColor        =   [UIColor blackColor];
        self.cancleBackGroundColor      =   [UIColor redColor];
        self.suerBackGroundColor        =   [UIColor redColor];
        self.buttonTitleFont            =   18.0;
        self.backgroundAlpha            =   0.6;
    }
    return self;
}

- (void)showAlterViewWithMessage:(NSString *)str {
    
    /**
     提示语
     */
    UILabel *messageStr = [[UILabel alloc]init];
    [self addSubview:messageStr];
    messageStr.text = str;
    messageStr.textColor = self.titleTextColor;
    messageStr.font = [UIFont systemFontOfSize:self.textFont];
    [messageStr autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:0];
    [messageStr autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:self withOffset:0];
    [messageStr autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:self withOffset:0];
    [messageStr autoSetDimension:ALDimensionHeight toSize:30.0];
    
    messageStr.backgroundColor = [UIColor redColor];
    messageStr.textAlignment = NSTextAlignmentCenter;

    /**
     横线
     */
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor whiteColor];
    lineView.frame = CGRectMake(0, 30, VIEW_W, 2);
    [self addSubview:lineView];
    
    
    /**
     *  取消按钮
     */
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:cancleBtn];
    [cancleBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:lineView withOffset:25.0];
    [cancleBtn autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:self withOffset:10.0];
    [cancleBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-25.0];
    [cancleBtn autoSetDimension:ALDimensionWidth toSize:70.0];
    cancleBtn.backgroundColor = self.cancleBackGroundColor;
    [cancleBtn setTitle:@"取消" forState:0];
    [cancleBtn setTitle:@"已点击" forState:UIControlStateHighlighted ];
    cancleBtn.layer.masksToBounds = YES;
    cancleBtn.layer.cornerRadius = 3;
    cancleBtn.tag = BtnTag + 1;
    [cancleBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
    

    /**
     *  确认按钮
     */
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:sureBtn];
    [sureBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:lineView withOffset:25.0];
    [sureBtn autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:self withOffset:-10.0];
    [sureBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-25.0];
    [sureBtn autoSetDimension:ALDimensionWidth toSize:70.0];
    sureBtn.backgroundColor = self.suerBackGroundColor;
    [sureBtn setTitle:@"确认" forState:0];
    [sureBtn setTitle:@"已点击" forState:UIControlStateHighlighted ];
    sureBtn.layer.masksToBounds = YES;
    sureBtn.layer.cornerRadius = 3;
    sureBtn.tag = BtnTag + 2;
    [sureBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];

  
    self.frame = CGRectMake((KScreen_W - VIEW_W) * 0.5, -100, VIEW_W, VIEW_H);
    self.alpha = self.backgroundAlpha ;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3f];
    [[[UIApplication sharedApplication] delegate].window addSubview:self];
    self.frame = CGRectMake((KScreen_W - VIEW_W) * 0.5, (KScreen_H - VIEW_H) * 0.5, VIEW_W, VIEW_H);
    self.backgroundColor = self.viewBackGroundColor;
    self.alpha = 0.9;
    [UIView commitAnimations];

}

- (void)clickButton:(UIButton *)sender {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0f];
    self.alpha = 0;
    self.frame = CGRectMake((KScreen_W - VIEW_W) * 0.5, KScreen_H + 100, VIEW_W, VIEW_H);
    [UIView commitAnimations];
    

    if ([_delegate respondsToSelector:@selector(didClickButtonAtIndex:)]) {
        [_delegate didClickButtonAtIndex:(sender.tag - 1)];
    }
    [self performSelector:@selector(fadeWay) withObject:nil afterDelay:.5f];
    
    
}

- (void)fadeWay {
    [self removeFromSuperview];
}
@end
