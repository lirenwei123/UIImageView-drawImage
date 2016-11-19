//
//  LRWview5.m
//  draw
//
//  Created by rwli on 16/11/19.
//  Copyright © 2016年 companyName. All rights reserved.
//

#import "LRWview5.h"
#import "Header.h"

@implementation LRWview5
-(void)drawRect:(CGRect)rect{
    //画一个微信刷新的图标
    CGPoint center =CGPointMake(rect.size.width*0.5, rect.size.height*0.5);
    CGFloat R=MIN(rect.size.width, rect.size.height)*.45;
    CGFloat r =R*.25;
    
    UIBezierPath *path =[UIBezierPath bezierPathWithArcCenter:center radius:R startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [path setLineWidth:5];
    [[UIColor whiteColor]set];
    [path stroke];
    
    
    
    

    NSArray *smallarry =[self arryWithSMALLradois:r center:center];
    NSArray *bigarry =[self arryWithBIGradois:R center:center];
    static CGFloat startAngel=-M_PI*0.5;
    CGFloat enAngel;
    for (int i=0; i<smallarry.count; i+=2) {
        //画弧填充颜色
        enAngel =startAngel+M_PI*0.25;
        UIBezierPath *pa =[UIBezierPath bezierPath];
        
        
        CGPoint p1 =CGPointFromString(smallarry[i]);
        CGPoint p2 =CGPointFromString(bigarry[i]);
        CGPoint p3 =CGPointFromString(smallarry[i+1]);
        CGPoint p4 =CGPointFromString(bigarry[i+1]);

        
        [pa moveToPoint:p1];
        [pa addLineToPoint:p2];
        [pa moveToPoint:p4];
        [pa addLineToPoint:p3];
        [pa addArcWithCenter:center radius:R startAngle:startAngel endAngle:enAngel clockwise:YES];
        //
        [[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]setFill];
        [pa fill];
        
        [pa setLineWidth:10];
        [[UIColor whiteColor]set];
        [pa stroke];
        //绘制相邻的一个
        UIBezierPath *pa1 =[UIBezierPath bezierPath];
        [pa1 moveToPoint:p3];
        [pa1 addLineToPoint:p4];
        if (i==smallarry.count-2) {
            CGPoint p_1 =CGPointFromString(smallarry[0]);
            CGPoint p_2 =CGPointFromString(bigarry[0]);
            [pa1 moveToPoint:p_2];
            [pa1 addLineToPoint:p_1];
            [pa1 addLineToPoint:p3];
        }
        startAngel=enAngel;
        enAngel =startAngel+M_PI*0.25;
        
        [pa1 addArcWithCenter:center radius:R startAngle:startAngel endAngle:enAngel clockwise:YES];
          startAngel=enAngel;
       
     
        
        [[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]setFill];
        [pa1 fill];
        
        [[UIColor whiteColor] setStroke];
        [pa1 setLineWidth:10];
        [pa1 stroke];
    
    }
    //画里面2个小圆
    path=[UIBezierPath bezierPathWithArcCenter:center radius:r+5 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [[UIColor greenColor]set];
    [path fill];
    path=[UIBezierPath bezierPathWithArcCenter:center radius:r-5 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [[UIColor blackColor]set];
    [path fill];
    
    path=[UIBezierPath bezierPathWithArcCenter:center radius:2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [[UIColor whiteColor]set];
    [path fill];
}

    //计算8个点
-(NSArray*)arryWithBIGradois:(CGFloat)radoius center:(CGPoint)center{
    CGFloat x=center.x;
    CGFloat y=center.y;
#define  fctor  sin(M_PI*0.25)
    NSString *str1=NSStringFromCGPoint(CGPointMake(x, y-radoius));
    NSString *str2=NSStringFromCGPoint(CGPointMake(x+radoius*fctor, y-radoius*fctor));
    NSString *str3=NSStringFromCGPoint(CGPointMake(x+radoius, y));
    NSString *str4=NSStringFromCGPoint(CGPointMake(x+radoius*fctor, y+radoius*fctor));
    NSString *str5=NSStringFromCGPoint(CGPointMake(x, y+radoius));
    NSString *str6=NSStringFromCGPoint(CGPointMake(x-radoius*fctor, y+radoius*fctor));
    NSString *str7=NSStringFromCGPoint(CGPointMake(x-radoius, y));
    NSString *str8=NSStringFromCGPoint(CGPointMake(x-radoius*fctor, y-radoius*fctor));
    NSArray *arry=@[str1,str2,str3,str4,str5,str6,str7,str8];
    return arry;
    
}
-(NSArray*)arryWithSMALLradois:(CGFloat)radoius center:(CGPoint)center{
#define  fctor  sin(M_PI*0.25)
    CGFloat x=center.x;
    CGFloat y=center.y;
    NSString *str1=NSStringFromCGPoint(CGPointMake(x, y-radoius));
    NSString *str2=NSStringFromCGPoint(CGPointMake(x+radoius*fctor, y-radoius*fctor));
    NSString *str3=NSStringFromCGPoint(CGPointMake(x+radoius, y));
    NSString *str4=NSStringFromCGPoint(CGPointMake(x+radoius*fctor, y+radoius*fctor));
    NSString *str5=NSStringFromCGPoint(CGPointMake(x, y+radoius));
    NSString *str6=NSStringFromCGPoint(CGPointMake(x-radoius*fctor, y+radoius*fctor));
    NSString *str7=NSStringFromCGPoint(CGPointMake(x-radoius, y));
    NSString *str8=NSStringFromCGPoint(CGPointMake(x-radoius*fctor, y-radoius*fctor));
    NSArray *arry=@[str7,str8,str1,str2,str3,str4,str5,str6,];
    return arry;
    
}

#if 0
-(void)layoutSubviews{
    CGRect rect =CGRectMake(0, (self.frame.size.height-self.frame.size.width)*0.5, self.frame.size.width, self.frame.size.width);
    UIImage *img =[UIImageView image_cutwithOval_rect:rect fromview:self];
    [UIImageView image:img savetofile:@"/Users/rwli/Desktop/dsa.png" imageformat:@"PNG"];
   
}
#endif
@end
