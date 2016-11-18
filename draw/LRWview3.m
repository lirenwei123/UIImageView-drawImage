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
    
    self.imgv.image =[UIImageView imageWithimgname:@"12.jpg" watermark:@"ereregr测人分为恶法饿饿" attributeDic:@{NSForegroundColorAttributeName:[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:50]}];
    
}

@end
