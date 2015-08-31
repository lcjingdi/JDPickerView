//
//  PlateNumberView.m
//  自定义PickerView测试
//
//  Created by lcjingdi on 15/8/31.
//  Copyright (c) 2015年 lcjingdi. All rights reserved.
//

#import "PlateNumberView.h"

@interface PlateNumberView() <UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong) NSArray *pickerArray;


@property (nonatomic,copy) NSString *str;

@end

@implementation PlateNumberView

- (instancetype)initWithInfoName:(NSString *)infoName andFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        // 加载plist
        NSString *path = [[NSBundle mainBundle] pathForResource:infoName ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        self.pickerArray = array;
        
        // 设置pickerView
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44)];
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        button1.backgroundColor = [UIColor yellowColor];
        [button1 setTitle:@"取消" forState:UIControlStateNormal];
        button1.frame = CGRectMake(self.frame.size.width - 44, 0, 44, 44);
        [view addSubview:button1];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button2 addTarget:self action:@selector(dismissAndSendParams) forControlEvents:UIControlEventTouchUpInside];
        [button2 setTitle:@"确定" forState:UIControlStateNormal];
        button2.frame = CGRectMake(0, 0, 44, 44);
        button2.backgroundColor = [UIColor blueColor];
        [view addSubview:button2];
        
        view.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view];
        UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, self.frame.size.width, self.frame.size.height)];
        picker.delegate = self;
        [self addSubview:picker];
    }
    return self;
}
- (void)dismiss{
    if (self.delegate && [self.delegate respondsToSelector:@selector(plateNumberDismissPicker)]) {
        [self.delegate plateNumberDismissPicker];
    }
}
- (void)dismissAndSendParams{
    if (self.delegate && [self.delegate respondsToSelector:@selector(plateNumberDismissPickerSendString:)]) {
        [self.delegate plateNumberDismissPickerSendString:self.str];
    }
}
- (NSArray *)pickerArray{
    if (!_pickerArray) {
        _pickerArray = [[NSArray alloc] init];
    }
    return _pickerArray;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    // 判断数组里面是否有数组
    if ([self.pickerArray[0] isKindOfClass:[NSArray class]]) {
        return self.pickerArray.count;
    }else {
        return 1;
    }
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    // 判断数组里面是否有数组
    if ([self.pickerArray[0] isKindOfClass:[NSArray class]]) {
        return [self.pickerArray[component] count];
    }else {
        return self.pickerArray.count;
    }
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    // 判断数组里面是否有数组
    if ([self.pickerArray[0] isKindOfClass:[NSArray class]]) {
        NSArray *array = self.pickerArray[component];
        return array[row];
    } else {
        return self.pickerArray[row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // 判断数组里面是否有数组
    NSMutableString *str = [[NSMutableString alloc] init];
    if ([self.pickerArray[0] isKindOfClass:[NSArray class]]) {
        for (int i = 0; i < self.pickerArray.count; i++) {
            NSUInteger r = [pickerView selectedRowInComponent:i];
            [str appendString:self.pickerArray[i][r]];
        }
    } else {
        str = self.pickerArray[row];
    }
    self.str = str;
    
}
@end
