//
//  FristViewController.m
//  XDSegeMentControl
//
//  Created by 杨超 on 16/4/18.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "FristViewController.h"

@interface FristViewController ()

@end

@implementation FristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *imageview = [UIImageView new];
    imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    imageview.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageview];
    
    // Do any additional setup after loading the view.
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
