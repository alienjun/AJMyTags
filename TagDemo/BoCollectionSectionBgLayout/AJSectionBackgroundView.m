//
//  AJSectionBackgroundView.m
//  AJTags
//
//  Created by AlienJunX on 15/9/9.
//  Copyright (c) 2015 AlienJunX
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "AJSectionBackgroundView.h"

@interface AJSectionBackgroundView()
@property (weak,nonatomic) UIView *bgview;
@end

@implementation AJSectionBackgroundView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *bgview = [[UIView alloc] init];
        bgview.layer.borderColor = [UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1.0].CGColor;
        bgview.layer.borderWidth = 0.5;
        bgview.backgroundColor = [UIColor whiteColor];
        bgview.layer.cornerRadius = 2.0;
        [self addSubview:bgview];
        self.bgview = bgview;
        _bgview.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_bgview]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bgview)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_bgview]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_bgview)]];
    }
    return self;
}


@end
