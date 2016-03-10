//
//  ExampleViewController.m
//  TagDemo
//
//  Created by AlienJunX on 16/3/10.
//  Copyright © 2016年 com.alienjun.demo. All rights reserved.
//

#import "ExampleViewController.h"
#import "AJTagsView.h"
#import "AJTagModel.h"


@interface ExampleViewController()
@property (weak, nonatomic) IBOutlet AJTagsView *tagsView;
@property (strong, nonatomic) NSMutableArray *originDataList;
@property (strong, nonatomic) NSMutableArray *selectedList;
@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.originDataList = [AJTagModel initData];
    self.selectedList = [NSMutableArray array];
    
    for (int i = 0; i < self.originDataList.count; i++) {
        if (i < 8) {
            [self.selectedList addObject:self.originDataList[i]];
        }
    }
    
    self.tagsView.originDataList = self.originDataList;
    self.tagsView.selectedList = self.selectedList;
    
    [self.tagsView reloadDataInfo];
}

@end
