//
//  LRWview2.m
//  draw
//
//  Created by rwli on 16/11/19.
//  Copyright © 2016年 companyName. All rights reserved.
//

#import "LRWview2.h"
#import "Header.h"

@implementation LRWview2

-(void)drawRect:(CGRect)rect{
    //圆的
    UIImage *img1 =[UIImage imageNamed:@"5.jpg"];
    
    self.imgv1.image =[UIImageView ovalImageWithimg:img1 borderWidth:50 borferColor:[UIColor redColor] rectWfactor:0.8 rectHfactor:1];

}
@end
