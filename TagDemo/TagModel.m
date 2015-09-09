//
//  TagModel.m
//  TagDemo
//
//  Created by AlienJunX on 15/9/9.
//  Copyright (c) 2015年 com.alienjun.demo. All rights reserved.
//

#import "TagModel.h"


@implementation TagModel


+(NSMutableArray *)initData{
    NSMutableArray *marray = [[NSMutableArray alloc] init];
    for (int i=0; i<[self arrayText].count; i++) {
        TagModel *t = [[TagModel alloc] init];
        t.index = i;
        t.text = [self arrayText][i];
//        t.color = @"708c3b";
        [marray addObject:t];
    }
    
    return marray;
}

+(NSArray *)arrayText{
    return @[@"帅气",@"完美大人",@"好给力",@"好厉害",@"编程高手",@"设计师",@"有品位",@"色彩玩家",@"颜值高",@"善于沟通",@"牛逼闪闪",@"哈哈",@"潜力股",@"富二代",@"跑车一族",@"牛叉",@"泡妞高手",@"萝莉控",@"爱喝啤酒吃烧烤",@"外星人",@"妹子",@"妞妞",@"瓦窑",@"丽丽",@"土豪",@"冲锋枪啊",];
}
@end
