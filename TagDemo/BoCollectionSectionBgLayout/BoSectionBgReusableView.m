//
//  BoSectionBgReusableView.m
//  CollectionSectionView
//
//  Created by AlienJunX on 15/9/9.
//  Copyright (c) 2015年 com.alienjun.demo. All rights reserved.
//

#import "BoSectionBgReusableView.h"

@interface BoSectionBgReusableView()
@property (weak,nonatomic) UIView *bgview;
@end

@implementation BoSectionBgReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *v = [[UIView alloc] init];
        v.layer.borderColor = [UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1.0].CGColor;
        v.layer.borderWidth = 0.5;
        v.backgroundColor = [UIColor whiteColor];
        v.layer.cornerRadius = 2.0;
        [self addSubview:v];
        _bgview = v;
        _bgview.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_bgview]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bgview)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_bgview]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bgview)]];
    }
    return self;
}


@end
