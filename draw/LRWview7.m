//
//  LRWview7.m
//  draw
//
//  Created by rwli on 16/11/20.
//  Copyright © 2016年 companyName. All rights reserved.
//

#import "LRWview7.h"
#import "UIView+LRWview.h"
@interface LRWview7()
@property (strong,nonatomic)NSMutableArray *arry;
@property (strong,nonatomic)NSMutableArray *subv;
@property (assign,nonatomic)CGPoint cuP;
@property (assign,nonatomic)int flag;
@property (strong,nonatomic)NSString *codeSetStr1;
@property (strong,nonatomic)NSString *codeSetStr2;
@end

@implementation LRWview7




-(void)layoutSubviews{
    [super layoutSubviews];

    [self setup];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL bl =[defaults objectForKey:@"firstLogin"];
    if (!bl) {
        NSLog(@"第一次登录请设置密码");
    }
}
-(void)setup{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *img1 =[[UIImage imageNamed:@"26.jpg"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *img2 =[[UIImage imageNamed:@"dsa"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btn setImage:img1 forState:UIControlStateNormal];
    [btn setImage:img2 forState:UIControlStateSelected];
    btn.backgroundColor=[UIColor clearColor];
    btn.userInteractionEnabled =NO;
   
   self.subv = [UIView setup_9layoutWithWidth:self.frame.size.width/6 addView:btn inview:self Wnum:5 Hnum:4];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    CGPoint p =[[touches anyObject] locationInView:self];
    int i=1;
    for (UIButton *btn in self.subv) {
        btn.tag=i;
        i++;
        if(CGRectContainsPoint(btn.frame, p)){
            [self.arry addObject:btn];
            btn.selected=YES;
        }
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint p =[[touches anyObject] locationInView:self];
    for (UIButton *btn in self.subviews) {
        if(CGRectContainsPoint(btn.frame, p)&&!btn.selected){
            [self.arry addObject:btn];
            btn.selected=YES;
        }else{
            self.cuP =p;
        }
    }
[self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSMutableString *codeStr=@"".mutableCopy;
    for (UIButton *btn in self.arry) {
        btn.selected=NO;
        
        [codeStr appendFormat:@"%ld",btn.tag];
       
    }
    if (self.flag==1024) {
        self.codeSetStr2=codeStr;
        self.flag=1025;
    }else{
    self.codeSetStr1=codeStr;
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     NSString *path =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"gestureCode"];
    
    
    //做是否第一次登录及设置密码缓存逻辑
#if 1
    BOOL bl =[defaults objectForKey:@"firstLogin"];

    if (!bl) {
//这是设置2次密码比较适否设置相同的业务逻辑
        if (self.flag!=1025) {
        UIAlertView *alertv=[[UIAlertView alloc]initWithTitle:@"再次输入确认一次你输的密码" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        [alertv show];
        self.flag=1024;
            [self.arry removeAllObjects];
            [self setNeedsDisplay];
        return;
        }
        bool isequarl =[self.codeSetStr1 isEqualToString:self.codeSetStr2];
        if (!isequarl) {
            [self.arry removeAllObjects];
            [self setNeedsDisplay];
             UIAlertView *alertv=[[UIAlertView alloc]initWithTitle:@"密码不一致,设置密码失败sb" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertv show];
            self.flag=0;
            return;
        }
//保存密码之沙河
        if( [codeStr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil]){
            NSLog(@"密码保存成功");
            [defaults setBool:YES forKey:@"firstLogin"];
        }
        
    }else{
        //从沙河取出密码进行比较
        NSString *str =[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"从沙河取出的code =%@",str);
        if ([codeStr isEqualToString:str]) {
            UIAlertView *alerv =[[UIAlertView alloc]initWithTitle:@"密码提示" message:@"密码正确" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认1",@"确认2",@"确认3", nil];
            [alerv show];
            
           
            
        }else{
            UIAlertView *alerv =[[UIAlertView alloc]initWithTitle:@"密码提示" message:@"密码错误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认1",@"确认2",@"确认3", nil];
            [alerv show];
            NSLog(@"－－－－－－大SB---------");
        }
    }
    
#endif
    
     [self.arry removeAllObjects];

    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    UIBezierPath *path =[UIBezierPath bezierPath ];
    if (self.arry.count) {
    for (int i=0; i<self.arry.count ; i++) {
        UIButton *btn =self.arry[i];
        if (!i) {
            [path moveToPoint:btn.center];
        }else{
            [path addLineToPoint:btn.center];
        }
        
    }
        [path addLineToPoint:self.cuP];
    }
    [path setLineJoinStyle:kCGLineJoinRound];
    [path setLineWidth:20];
    [[UIColor lightGrayColor]set];
    [path stroke];
}


-(NSMutableArray *)arry{
    if (!_arry) {
        _arry =@[].mutableCopy;
    }
    return _arry;
}
@end
