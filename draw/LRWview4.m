//
//  LRWview4.m
//  draw
//
//  Created by rwli on 16/11/19.
//  Copyright © 2016年 companyName. All rights reserved.
//
#import "Header.h"
#import "LRWview4.h"

@interface LRWview4()
@property (assign,nonatomic) CGPoint originalP;
@property (assign,nonatomic)CGPoint currentP;
@property (strong,nonatomic)UIView *coverView;//这里的weak确实有点坑，不这样写就添加不到上面


@end
@implementation LRWview4



-(void)layoutSubviews{
    UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.imgv addGestureRecognizer:pan];
    
}
-(void)pan:(UIPanGestureRecognizer*)pan{
    
    CGPoint point =[pan locationInView:self.imgv];
    if (pan.state ==UIGestureRecognizerStateBegan) {
        self.originalP=point;
    }else if(pan.state ==UIGestureRecognizerStateChanged){
        self.currentP =point;
        CGRect rect =CGRectMake(self.originalP.x, self.originalP.y, self.currentP.x-self.originalP.x, self.currentP.y-self.originalP.y);
        self.coverView.frame =rect;
    }else if(pan.state ==UIGestureRecognizerStateEnded){
       [UIImageView image_cutwithrect:self.coverView.frame fromimgv:self.imgv];
        [self.coverView removeFromSuperview];//如果是strong，虽然移除了，但是他还是存在有值的，就不会进入下次懒加载加到视图上去
        self.coverView=nil;
        NSLog(@"---%@",self.coverView);
    }
}

-(UIView *)coverView{
    if (_coverView==nil) {
        _coverView=[[UIView alloc]init];
        _coverView.backgroundColor =[UIColor grayColor];
        _coverView.alpha =0.7;
        [self addSubview:_coverView];
    }

    return _coverView;
}
@end
