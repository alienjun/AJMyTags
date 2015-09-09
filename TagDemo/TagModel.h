//
//  TagModel.h
//  TagDemo
//
//  Created by AlienJunX on 15/9/9.
//  Copyright (c) 2015年 com.alienjun.demo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagModel : NSObject
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *color;
@property (nonatomic) NSInteger index;

+(NSMutableArray *)initData;

@end
