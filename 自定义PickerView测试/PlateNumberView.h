//
//  PlateNumberView.h
//  自定义PickerView测试
//
//  Created by lcjingdi on 15/8/31.
//  Copyright (c) 2015年 lcjingdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlateNumberViewDelegate <NSObject>

@required
- (void)currentSelectedTitle:(NSString *)title;

@end

@interface PlateNumberView : UIView

- (instancetype)initWithInfoName:(NSString *)infoName andFrame:(CGRect)frame;

@property (nonatomic,weak) id<PlateNumberViewDelegate> delegate;


@end