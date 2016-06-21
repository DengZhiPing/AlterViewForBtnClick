//
//  DZPALterViewWithBtn.h
//  AlterViewWithBtn
//
//  Created by dengzhiping on 16/6/21.
//  Copyright © 2016年 dengzhiping. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DZPALterViewWithBtnDelegate <NSObject>

-(void)didClickButtonAtIndex:(NSUInteger)index;

@end

@interface DZPALterViewWithBtn : UIView

@property (weak,nonatomic) id<DZPALterViewWithBtnDelegate> delegate;

/**
 *  弹窗视图的背景透明度
 */
@property (nonatomic, assign) CGFloat backgroundAlpha;

/**
 *  弹窗视图提示语
 */
@property (nonatomic, copy) NSString *titleMeassageStr;

/**
 *  弹窗视图的宽度
 */
@property (nonatomic, assign) CGFloat viewWidth;

/**
 *  弹窗视图的高度
 */
@property (nonatomic, assign) CGFloat viewHeight;

/**
 *  弹窗视图提示字体大小
 */
@property (nonatomic, assign) CGFloat textFont;

/**
 *  弹窗视图字体的颜色
 */
@property (nonatomic, strong) UIColor *titleTextColor;

/**
 *  弹窗视图背景颜色
 */
@property (nonatomic, strong) UIColor *viewBackGroundColor;


/**
 *  弹窗视图取消按钮的背景颜色
 */
@property (nonatomic, strong) UIColor *cancleBackGroundColor;

/**
 *  弹窗视图确定按钮的背景颜色
 */
@property (nonatomic, strong) UIColor *suerBackGroundColor;

/**
 *  按钮字体大小
 */
@property (nonatomic, assign) CGFloat buttonTitleFont;



/**
 *  弹出提示框
 */
- (void)showAlterViewWithMessage:(NSString *)str;

@end
