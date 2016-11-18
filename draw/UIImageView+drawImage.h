//
//  UIImageView+drawImage.h
//  draw
//
//  Created by rwli on 16/11/19.
//  Copyright © 2016年 companyName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (drawImage)
//圆形的图片
+(UIImage*)roundImageWithimgname:(NSString*)imgname;
//椭圆的图片 fctor_w ：图片依原始宽比例0-1； fctor_h：图片依原始高比例0-1；
+(UIImage*)ovalImageWithimgname:(NSString*)imgname rectWfactor:(CGFloat)fctor_w rectHfactor:(CGFloat)fctor_h;

//带边框的圆形图片，
+(UIImage*)roundImageWithimgname:(NSString*)imgname borderWidth:(CGFloat)borderWidth borferColor:(UIColor*)color;
//带边框的椭圆形图片，
+(UIImage*)ovalImageWithimgname:(NSString*)imgname borderWidth:(CGFloat)borderWidth borferColor:(UIColor*)color rectWfactor:(CGFloat)fctor_w rectHfactor:(CGFloat)fctor_h;

//带水印的图片
+(UIImage*)imageWithimgname:(NSString*)imgname watermark:(NSString*)watermark attributeDic:(NSDictionary*)attributeDic;
@end
