//
//  LRWview1.m
//  draw
//
//  Created by rwli on 16/11/19.
//  Copyright © 2016年 companyName. All rights reserved.
//

#import "LRWview1.h"
#import "Header.h"

@implementation LRWview1

- (void)drawRect:(CGRect)rect {
    //圆的
    UIImage *img1 =[UIImage imageNamed:@"5.jpg"];
    UIImage *img2 =[UIImage imageNamed:@"6.jpg"];
    self.imgv.image =[UIImageView roundImageWithimg:img1];
    self.imgv1.image=[UIImageView ovalImageWithimg:img2 rectWfactor:0.8 rectHfactor:1];
}

@end
