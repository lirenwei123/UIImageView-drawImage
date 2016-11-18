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
    self.imgv1.image =[UIImageView roundImageWithimgname:@"12.jpg" borderWidth:20 borferColor:[UIColor greenColor]];

}
@end
