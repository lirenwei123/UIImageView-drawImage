//
//  LRWview6.m
//  draw
//
//  Created by rwli on 16/11/19.
//  Copyright © 2016年 companyName. All rights reserved.
//

#import "LRWview6.h"

@implementation LRWview6

-(void)drawRect:(CGRect)rect{
    UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.imgv addGestureRecognizer:pan];
    
}
-(void)pan:(UIPanGestureRecognizer*)pan{
    CGPoint p =[pan locationInView:self.imgv];
    CGFloat w =20;
    CGRect rect =CGRectMake(p.x-w*0.5, p.y-w*0.5, w, w);
    UIGraphicsBeginImageContextWithOptions(self.imgv.frame.size, NO, 0);
   CGContextRef ctx= UIGraphicsGetCurrentContext();
    [self.imgv.layer renderInContext:ctx];
    CGContextClearRect(ctx ,rect );
    UIImage *img =UIGraphicsGetImageFromCurrentImageContext();
    self.imgv.image=img;
    UIGraphicsEndImageContext();
}
@end
