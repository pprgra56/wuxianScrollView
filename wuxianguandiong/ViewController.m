//
//  ViewController.m
//  wuxianguandiong
//
//  Created by 常琼 on 2016/12/20.
//  Copyright © 2016年 sudiyi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property(strong,nonatomic) IBOutlet UIScrollView *scrollview;

@property(strong,nonatomic) NSMutableArray *array;

@property(strong,nonatomic) UIImageView *image1;
@property(strong,nonatomic) UIImageView *image2;
@property(strong,nonatomic) UIImageView *image3;

@property(assign,nonatomic) NSInteger flag;
@end

@implementation ViewController
-(NSMutableArray *)array{
    if(_array == nil) {
        _array = [NSMutableArray array];
        [_array addObject:[UIImage imageNamed:@"1"]];
        [_array addObject:[UIImage imageNamed:@"2"]];
        [_array addObject:[UIImage imageNamed:@"3"]];
        [_array addObject:[UIImage imageNamed:@"4"]];
        [_array addObject:[UIImage imageNamed:@"5"]];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollview.delegate = self;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.scrollview.contentSize = CGSizeMake(width*3, 128);
    self.scrollview.pagingEnabled = YES;

    self.image1  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 128)];
    self.image2  = [[UIImageView alloc] initWithFrame:CGRectMake(width, 0, width, 128)];
    self.image3 = [[UIImageView alloc] initWithFrame:CGRectMake(width*2, 0, width, 128)];

    [self.image2 setImage:self.array[0]];
    [self.image1 setImage:self.array[4]];
    [self.image3 setImage:self.array[1]];


    [self.scrollview addSubview:self.image1];
    [self.scrollview addSubview:self.image2];
    [self.scrollview addSubview:self.image3];


    //显示第二个 uiimageview
    self.scrollview .contentOffset = CGPointMake(width, 0);



}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;

    if( scrollView.contentOffset.x ==0){
        //1(上一张)
        if( self.flag ==0){
            self.flag = (self.array.count-1);
        }else{
            self.flag --;
        }
    }else if(scrollView.contentOffset.x == width){
        //2(本张)

    }else{
        //3(下一张)
        if(self.flag ==(self.array.count-1)){
            self.flag = 0;
        }else{
            self.flag ++;
        }

    }
    scrollView.contentOffset  = CGPointMake(width, 0);

    //几个有用的数字
    NSInteger lastone = self.flag==0?(self.array.count-1):(self.flag-1);
    NSInteger nextone = self.flag== (self.array.count-1)?0:(self.flag+1);


    [self.image2 setImage:self.array[self.flag]];
    [self.image1 setImage:self.array[lastone]];
    [self.image3 setImage:self.array[nextone]];




    NSLog(@"\U0001F449 前一个:%ld  当前:%ld 后一个:%ld \U0001F448 %s[%d] " ,lastone,self.flag,nextone, __PRETTY_FUNCTION__, __LINE__);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
