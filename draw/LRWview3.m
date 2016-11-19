//
//  LRWview3.m
//  draw
//
//  Created by rwli on 16/11/19.
//  Copyright © 2016年 companyName. All rights reserved.
//

#import "LRWview3.h"
#import "Header.h"

@implementation LRWview3

-(void)drawRect:(CGRect)rect{
    
    UIImage *img1 =[UIImage imageNamed:@"5.jpg"];
    
    img1 =[UIImageView ovalImageWithimg:img1 borderWidth:50 borferColor:[UIColor redColor] rectWfactor:0.8 rectHfactor:1];
    img1 =[UIImageView imageWithimg:img1 watermark:@"ffefnsfseDEWFEFESFEOIFEORIHERO" attributeDic:@{NSFontAttributeName:[UIFont systemFontOfSize:50]} watermarkdrawAtPoint:CGPointMake(20, 20)];
    self.imgv.image=img1;
    [UIImageView image_cutwithrect:CGRectMake(50, 50, 200, 200) fromimgv:self.imgv];
    
   

}
-(void)layoutSubviews{
    
    UIImageView *imgv =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    imgv.image =[UIImageView imageWithview:self];
    [self addSubview:imgv];
    
}

@end
