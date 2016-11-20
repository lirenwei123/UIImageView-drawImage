//
//  UIView+LRWview.h
//  draw
//
//  Created by rwli on 16/11/20.
//  Copyright © 2016年 companyName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LRWview)

//九宫格，，并返回九宫格里的视图的数组
+(NSMutableArray*)setup_9layoutWithWidth:(CGFloat)width addView:(UIView*)lrwView inview:(UIView*)inview Wnum:(NSInteger)Wnum Hnum:(NSInteger)Hnum;
//渲染cornerRadius
+(void)viewWithcornerRadius_view:(UIView*)view;
@end
