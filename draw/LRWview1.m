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
    self.imgv.image=  [UIImageView roundImageWithimgname:@"5.jpg"];
    self.imgv1.image= [UIImageView ovalImageWithimgname:@"6.jpg" rectWfactor:0.8 rectHfactor:1];
    
}

@end
