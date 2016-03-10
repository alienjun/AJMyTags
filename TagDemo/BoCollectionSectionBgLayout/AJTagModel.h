//
//  AJTagModel.h
//  TagDemo
//
//  Created by AlienJunX on 16/3/10.
//  Copyright © 2016年 com.alienjun.demo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJTagModel : NSObject
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *color;
@property (nonatomic) NSInteger index;

+ (NSMutableArray *)initData;

@end
