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

@end

@implementation PlateNumberView

- (instancetype)initWithInfoName:(NSString *)infoName andFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 加载plist
        NSString *path = [[NSBundle mainBundle] pathForResource:infoName ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        self.pickerArray = array;
        // 设置pickerView
        UIPickerView *picker = [[UIPickerView alloc] initWithFrame:self.bounds];
        picker.delegate = self;
        [self addSubview:picker];
    }
    return self;
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
    if (self.delegate && [self.delegate respondsToSelector:@selector(currentSelectedTitle:)]) {
        [self.delegate currentSelectedTitle:[str copy]];
    }
}
@end
