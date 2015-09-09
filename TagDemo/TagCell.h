//
//  BoModifyExpertiseCell.h
//  bobohair-iphone
//
//  Created by AlienJunX on 15/7/15.
//  Copyright (c) 2015年 Shanghai Metis IT Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
-(void)setTitleStr:(NSString *)title color:(NSString *)color;

@end
