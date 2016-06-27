//
//  TodayViewController.m
//  TodayExtension
//
//  Created by xudosom on 16/6/26.
//  Copyright © 2016年 上海优蜜科技有限公司. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <Masonry.h>
@interface TodayViewController () <NCWidgetProviding>
@property (strong, nonatomic)UILabel * label;
@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    CGRect frame = [UIScreen mainScreen].bounds;
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    _label.backgroundColor = [UIColor redColor];
    _label.text = @"xxxxxx";
    [self.view addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(60);
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSUserDefaults * defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.youmi.productList"];
    NSString * string = [defaults stringForKey:@"group.com.youmi.productList.today"];
    _label.text = string;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"xxxxxxxxxx");
    [self.extensionContext openURL:[NSURL URLWithString:@"extension://xxxxxx"] completionHandler:nil];
    
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
    return UIEdgeInsetsZero;
}
@end
