//
//  AJTagsCell.m
//  TagDemo
//
//  Created by AlienJunX on 16/3/10.
//  Copyright © 2016年 com.alienjun.demo. All rights reserved.
//

#import "AJTagsCell.h"
@interface AJTagsCell()
@property (weak, nonatomic) UIView *bgView;
@property (weak, nonatomic) UILabel *label;
@end

@implementation AJTagsCell

- (void)setTitleStr:(NSString *)title color:(NSString *)color {
    if (self.bgView == nil) {
        UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:bgView];
        self.bgView = bgView;
        bgView.layer.cornerRadius = 13;
    }
    if (self.label == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        label.font = [UIFont systemFontOfSize:12.0];
        label.textColor = UIColor.whiteColor;
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        self.label = label;
    }
    
    self.label.text = title;
    self.bgView.backgroundColor = [self createBGColor:color];
}

- (UIColor *)createBGColor:(NSString *)color {
    if (color.length < 6) {
        return [UIColor whiteColor];
    }
    long red = strtoul([[color substringWithRange:NSMakeRange(0, 2)] UTF8String],0,16);
    long green = strtoul([[color substringWithRange:NSMakeRange(2, 2)] UTF8String],0,16);
    long blue = strtoul([[color substringWithRange:NSMakeRange(4, 2)] UTF8String],0,16);
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0f];
}

@end
