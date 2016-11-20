//
//  UIView+LRWview.m
//  draw
//
//  Created by rwli on 16/11/20.
//  Copyright © 2016年 companyName. All rights reserved.
//

#import "UIView+LRWview.h"

@implementation UIView (LRWview)

+(NSMutableArray*)setup_9layoutWithWidth:(CGFloat)width addView:(UIView*)lrwView inview:(UIView*)inview Wnum:(NSInteger)Wnum Hnum:(NSInteger)Hnum{
    if (width>inview.frame.size.width/Wnum) {
        NSLog(@"设置的九宫格单位控件宽度太大");
        return nil;
    }
    if (width>inview.frame.size.height/Hnum) {
        NSLog(@"设置的九宫格单位控件高度太大");
        return nil;
    }
    CGFloat maginW =(inview.frame.size.width-Wnum*width)/(Wnum+1);
    CGFloat maginH =(inview.frame.size.height-Hnum*width)/(Hnum+1);
    
    NSMutableArray *arry =[NSMutableArray array];
    
    for (int i=0; i<Wnum*Hnum; i++) {
        NSData *data =[NSKeyedArchiver archivedDataWithRootObject:lrwView];
       
        UIView *v = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        v.frame =CGRectMake(i%Wnum*(width+maginW)+maginW, i/Wnum*(width+maginH)+maginH, width, width);
        [UIView viewWithcornerRadius_view:v];
        [inview addSubview:v];
        [arry addObject:v];
    }
    return arry;
}

+(void)viewWithcornerRadius_view:(UIView*)view{
    view.layer.masksToBounds=YES;
    view.layer.cornerRadius=view.frame.size.width*0.5;
    view.layer.borderColor=[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1].CGColor;
    view.layer.borderWidth=view.frame.size.width*0.15;
}

@end
