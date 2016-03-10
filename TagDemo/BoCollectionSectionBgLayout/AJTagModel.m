//
//  AJTagModel.m
//  TagDemo
//
//  Created by AlienJunX on 16/3/10.
//  Copyright © 2016年 com.alienjun.demo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AJTagModel.h"

@implementation AJTagModel

+ (NSMutableArray *)initData {
    NSMutableArray *marray = [[NSMutableArray alloc] init];
    for (int i=0; i<[self arrayText].count; i++) {
        AJTagModel *t = [[AJTagModel alloc] init];
        t.index = i;
        t.text = [self arrayText][i];
        t.color = [t randomColor];
        [marray addObject:t];
    }
    return marray;
}

+ (NSArray *)arrayText {
    return @[@"帅气",@"完美大人",@"好给力",@"好厉害",@"编程高手",@"设计师",@"有品位",@"色彩玩家",@"颜值高",@"善于沟通",@"牛逼闪闪",@"哈哈",@"潜力股",@"富二代",@"跑车一族",@"牛叉",@"泡妞高手",@"萝莉控",@"爱喝啤酒吃烧烤",@"外星人",@"妹子",@"妞妞",@"瓦窑",@"丽丽",@"土豪",@"冲锋枪啊",];
}

- (NSString *)randomColor {
    CGFloat r = ( arc4random() % 256 / 256.0 );
    CGFloat g = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat b = ( arc4random() % 128 / 256.0 ) + 0.5;
    
    return [NSString stringWithFormat:@"%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}


@end
