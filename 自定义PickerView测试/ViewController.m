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
@property (nonatomic,strong) NSArray *pickerArray;
@property (nonatomic,weak) UILabel *label;

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

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = ({
        UILabel *label = [[UILabel alloc] init];
        self.label = label;
        label.frame = CGRectMake(50, 333, 333, 200);
        label.text = @"xxxxxxxklasdjfa;sdfj";
        label;
    });
    [self.view addSubview:label];
    
    PlateNumberView *picker = [[PlateNumberView alloc] initWithInfoName:@"city" andFrame:CGRectMake(50, 50, 250, 200)];
//    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(50, 50, 250, 200)];
    picker.delegate = self;
//    [picker selectRow:2 inComponent:2 animated:YES];
    [self.view addSubview:picker];
}
- (void)currentSelectedTitle:(NSString *)title {
    self.label.text = title;
}
// returns the number of 'columns' to display.
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
//    return self.pickerArray.count;
//}
//
//// returns the # of rows in each component..
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//    return [self.pickerArray[component] count];
//}
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    NSArray *array = self.pickerArray[component];
//    return array[row];
//}
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//
//    // 第一列选择的行
//    NSUInteger row1 = [pickerView selectedRowInComponent:0];
//    NSString *str1 = self.pickerArray[0][row1];
//    
//    //第二列选择的行
//    NSUInteger row2 = [pickerView selectedRowInComponent:1];
//    NSString *str2 = self.pickerArray[1][row2];
//
//    // 第三列选择的行
//    NSUInteger row3 = [pickerView selectedRowInComponent:2];
//    NSString *str3 = self.pickerArray[2][row3];
//    
//    // 第四列选择的行
//    NSUInteger row4 = [pickerView selectedRowInComponent:3];
//    NSString *str4 = self.pickerArray[3][row4];
//    
//    // 第五列选择的行
//    NSUInteger row5 = [pickerView selectedRowInComponent:4];
//    NSString *str5 = self.pickerArray[4][row5];
//    
//    // 第六列选择的行
//    NSUInteger row6 = [pickerView selectedRowInComponent:5];
//    NSString *str6 = self.pickerArray[5][row6];
//    
//    // 第七列选择的行
//    NSUInteger row7 = [pickerView selectedRowInComponent:6];
//    NSString *str7 = self.pickerArray[6][row7];
//    
//    
//
//    self.label.text = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",str1,str2,str3,str4,str5,str6,str7];
//}
@end
