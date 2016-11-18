//
//  UIImageView+drawImage.m
//  draw
//
//  Created by rwli on 16/11/19.
//  Copyright © 2016年 companyName. All rights reserved.
//

#import "UIImageView+drawImage.h"

@implementation UIImageView (drawImage)
+(UIImage*)roundImageWithimgname:(NSString*)imgname {
    UIImage *img =[[UIImage imageNamed:imgname]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0);
    UIBezierPath *path =[UIBezierPath  bezierPathWithOvalInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    [path addClip];
    
    [img drawAtPoint:CGPointZero];
    UIImage *myimg =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myimg;
}

+(UIImage*)ovalImageWithimgname:(NSString*)imgname rectWfactor:(CGFloat)fctor_w rectHfactor:(CGFloat)fctor_h {
    UIImage *img =[[UIImage imageNamed:imgname]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0);
    UIBezierPath *path =[UIBezierPath  bezierPathWithOvalInRect:CGRectMake(0, 0, img.size.width*fctor_w, img.size.height*fctor_h)];
    [path addClip];
    
    [img drawAtPoint:CGPointZero];
    UIImage *myimg =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myimg;
}

+(UIImage*)roundImageWithimgname:(NSString*)imgname borderWidth:(CGFloat)borderWidth borferColor:(UIColor*)color{
    UIImage *img =[[UIImage imageNamed:imgname]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CGSize size =CGSizeMake(img.size.width+2*borderWidth, img.size.height+2*borderWidth);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    UIBezierPath *path =[UIBezierPath  bezierPathWithOvalInRect:CGRectMake(0, 0, size.width,size.height)];
    [color set];
    [path fill];
   path =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, img.size.width, img.size.height)];
    [path addClip];
    
    [img drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    UIImage *myimg =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myimg;
}
+(UIImage*)ovalImageWithimgname:(NSString*)imgname borderWidth:(CGFloat)borderWidth borferColor:(UIColor*)color rectWfactor:(CGFloat)fctor_w rectHfactor:(CGFloat)fctor_h{
    UIImage *img =[[UIImage imageNamed:imgname]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CGSize size =CGSizeMake(img.size.width*fctor_w+2*borderWidth, img.size.height*fctor_h+2*borderWidth);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    UIBezierPath *path =[UIBezierPath  bezierPathWithOvalInRect:CGRectMake(0, 0, size.width,size.height)];
    [color set];
    [path fill];
    path =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, img.size.width*fctor_w, img.size.height*fctor_h)];
    [path addClip];
    
    [img drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    UIImage *myimg =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myimg;
}

+(UIImage*)imageWithimgname:(NSString*)imgname watermark:(NSString*)watermark attributeDic:(NSDictionary*)attributeDic{
UIImage *img =[[UIImage imageNamed:imgname]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
UIGraphicsBeginImageContextWithOptions(img.size, NO, 0);
[img drawAtPoint:CGPointZero];
[watermark drawAtPoint:CGPointZero withAttributes:attributeDic];
UIImage *myimg =UIGraphicsGetImageFromCurrentImageContext();
UIGraphicsEndImageContext();
    return myimg;
}
@end
