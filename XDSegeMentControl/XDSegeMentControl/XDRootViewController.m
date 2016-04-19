//
//  XDRootViewController.m
//  XDSegeMentControl
//
//  Created by 杨超 on 16/4/18.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#define self_Width CGRectGetWidth([UIScreen mainScreen].bounds)
#define self_Height CGRectGetHeight([UIScreen mainScreen].bounds)

#import "XDRootViewController.h"
#import "LFLUISegmentedControl.h"
#import "FristViewController.h"
#import "SecondViewController.h"
#import "ThereViewController.h"
@interface XDRootViewController ()<LFLUISegmentedControlDelegate,UIScrollViewDelegate>

@property(nonatomic, strong)UIScrollView *mainScrollView; /**< 正文mainSV */
@property (nonatomic ,strong)LFLUISegmentedControl * LFLuisement; /**< LFLuisement */
@end

@implementation XDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self createMainScrollView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    LFLUISegmentedControl* LFLuisement=[[LFLUISegmentedControl alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))];
    LFLuisement.sliderColor = [UIColor blueColor];
    LFLuisement.delegate = self;
  
    LFLuisement.selectColor = [UIColor blueColor];
    //   2.设置显示切换标题数组
    NSArray* LFLarray=[NSArray arrayWithObjects:@"我有",@"我要",@"我有我要",nil];
    
    [LFLuisement AddSegumentArray:LFLarray];
    //   default Select the Button
    [LFLuisement selectTheSegument:0];
    self.LFLuisement = LFLuisement;
    [self.view addSubview:LFLuisement];
    
   

    // Do any additional setup after loading the view.
}
//创建正文ScrollView内容
//控件默认高度为34
- (void)createMainScrollView {
    CGFloat begainScrollViewY = 34+ 64;
    self.mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, begainScrollViewY, self_Width,(self_Height -begainScrollViewY))];
    self.mainScrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.mainScrollView];
    self.mainScrollView.bounces = NO;
    self.mainScrollView.pagingEnabled = YES;
    self.mainScrollView.contentSize = CGSizeMake(self_Width * 3, (self_Height -begainScrollViewY));
    //设置代理
    self.mainScrollView.delegate = self;
    
    NSArray *arry = @[@"FristViewController",@"SecondViewController",@"ThereViewController"];
    
    for (int i = 0; i < 3; i++) {
        Class className = NSClassFromString(arry[i]);
        UIViewController *view1 = [className new];
               view1.view.frame = CGRectMake(0+self.mainScrollView.frame.size.width*i,0, self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height);
        [self.mainScrollView addSubview:view1.view];
     
    }
}

#pragma mark --- UIScrollView代理方法

static NSInteger pageNumber = 0;

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    pageNumber = (int)(scrollView.contentOffset.x / self_Width + 0.5);
    //    滑动SV里视图,切换标题
    [self.LFLuisement selectTheSegument:pageNumber];
}

#pragma mark ---LFLUISegmentedControlDelegate
/**
 *  点击标题按钮
 *
 *  @param selection 对应下标 begain 0
 */
-(void)uisegumentSelectionChange:(NSInteger)selection{
    //    加入动画,显得不太过于生硬切换
    [UIView animateWithDuration:.2 animations:^{
        [self.mainScrollView setContentOffset:CGPointMake(self_Width *selection, 0)];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
