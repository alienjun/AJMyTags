//
//  BoModifyExpertiseCell.m
//  bobohair-iphone
//
//  Created by AlienJunX on 15/7/15.
//  Copyright (c) 2015年 Shanghai Metis IT Co.,Ltd. All rights reserved.
//

#import "TagCell.h"

@interface TagCell()

@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation TagCell

-(void)awakeFromNib{
    [super awakeFromNib];
    _bgView.layer.cornerRadius = 13;
    
}


-(void)setTitleStr:(NSString *)title color:(NSString *)color{
    [self.label setText:title];
    _bgView.backgroundColor = [self randomColor];
}


-(UIColor *)randomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
