//
//  ViewController.m
//  自定义PickerView测试
//
//  Created by lcjingdi on 15/8/31.
//  Copyright (c) 2015年 lcjingdi. All rights reserved.
//

#import "ViewController.h"
#import "PlateNumberView.h"

@interface ViewController ()<PlateNumberViewDelegate>
@property (nonatomic,weak) PlateNumberView *plateView;

@property (nonatomic,strong) NSArray *pickerArray;
@property (nonatomic,weak) UILabel *label;
@property (nonatomic,weak) UIButton *button;


@end

@implementation ViewController
- (NSArray *)pickerArray{
    if (!_pickerArray) {
        _pickerArray = [[NSArray alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _pickerArray = array;
    }
    return _pickerArray;
}
- (PlateNumberView *)plateView {
    if (_plateView == nil) {
        PlateNumberView *view = [[PlateNumberView alloc] initWithInfoName:@"city" andFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 180)];
        view.delegate = self;
        _plateView = view;
        [self.view addSubview:view];
    }
    return _plateView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = ({
        UILabel *label = [[UILabel alloc] init];
        self.label = label;
        label.frame = CGRectMake(50, 250, 333, 200);
        label.text = @"车牌号";
        label;
    });
    [self.view addSubview:label];
    
    UIButton *button = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [button addTarget:self action:@selector(pickerBUttonClick) forControlEvents:UIControlEventTouchUpInside];
        self.button = button;
        button.frame = CGRectMake(50, 50, 333, 200);
        button;
    });
    [self.view addSubview:button];
}
- (void)currentSelectedTitle:(NSString *)title {
    self.label.text = title;
}
- (void)pickerBUttonClick {
    if (self.plateView.frame.origin.y == self.view.frame.size.height) {
        NSLog(@"隐藏着的->%@",NSStringFromCGRect(self.plateView.frame));
        CGRect rect = self.plateView.frame;
        rect.origin.y -= 180;
        [UIView animateWithDuration:0.25 animations:^{
            self.plateView.frame = rect;
        }];
        NSLog(@"隐藏着的->%@",NSStringFromCGRect(self.plateView.frame));
    } else {
         NSLog(@"关闭隐藏->%@",NSStringFromCGRect(self.plateView.frame));
        CGRect rect = self.plateView.frame;
        rect.origin.y += 180;
        [UIView animateWithDuration:0.25 animations:^{
            self.plateView.frame = rect;
        }];
        NSLog(@"关闭隐藏->%@",NSStringFromCGRect(self.plateView.frame));
    }
}
@end
