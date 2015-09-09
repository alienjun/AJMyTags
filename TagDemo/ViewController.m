//
//  ViewController.m
//  TagDemo
//
//  Created by AlienJunX on 15/9/9.
//  Copyright (c) 2015年 com.alienjun.demo. All rights reserved.
//

#define kItemHeight 26
#define kMinimumLineSpacing 5
#define kMinimumInteritemSpacing 5

#define kSectionEdgeInsetsLeft 15
#define kSectionEdgeInsetsBottom 0
#define kSectionEdgeInsetsTop 5
#define kSectionEdgeInsetsRight 15

#define kMarginTop 134


#import "ViewController.h"
#import "TagCell.h"
#import "TagModel.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) NSMutableArray *originDataList;
@property (strong, nonatomic) NSMutableArray *selectedList;
@property (strong, nonatomic) NSMutableArray *unSelectedList;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    self.originDataList = [TagModel initData];
    
    for (int i=0 ; i<self.originDataList.count; i++) {
        if (i<8) {
            [self.selectedList addObject:self.originDataList[i]];
        }else{
            [self.unSelectedList addObject:self.originDataList[i]];
        }
    }
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger items = 1;
    if (section == 0) {
        items = [self.selectedList count];
    }else if (section == 1){
        items = [self.unSelectedList count];
    }
    return items;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    TagModel *model;
    if (indexPath.section==0) {
        model =self.selectedList[indexPath.row];
    }else if(indexPath.section == 1){
        model =self.unSelectedList[indexPath.row];
    }
    [cell setTitleStr:model.text color:model.color];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *view;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    }
    return view;
}


#pragma mark - UICollectionViewDelegateFlowLayout
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets inset = UIEdgeInsetsMake(kSectionEdgeInsetsTop, kSectionEdgeInsetsLeft, 5, kSectionEdgeInsetsRight);
    if (section == 0) {
        if (self.selectedList.count == 0) {
            inset = UIEdgeInsetsMake(5, 15, 31, 15);
        }
    }else if (section == 1){
        if (self.unSelectedList.count == 0) {
            inset = UIEdgeInsetsMake(5, 15, 93, 15);
        }
    }
    return inset;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return kMinimumLineSpacing;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return kMinimumInteritemSpacing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize size = CGSizeZero;
    TagModel *model;
    if (indexPath.section==0) {
        model = self.selectedList[indexPath.row];
    }else if(indexPath.section == 1){
        model = self.unSelectedList[indexPath.row];
    }
    size = [self calculateCellSize:model.text];
    return size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(0, CGFLOAT_MIN);
    }
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 30);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //insert 到原来的位置
        TagModel *model =self.selectedList[indexPath.row];
        NSInteger index = [self getObjectInListIndex:model];
        
        [self.unSelectedList insertObject:model atIndex:index];
        [self.selectedList removeObjectAtIndex:indexPath.row];
        
        NSIndexPath *newIndexPath =[NSIndexPath indexPathForItem:index inSection:1];
        [collectionView moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
    }else if(indexPath.section == 1){
        [self.selectedList addObject:self.unSelectedList[indexPath.row]];
        [self.unSelectedList removeObjectAtIndex:indexPath.row];
        
        NSIndexPath *newIndexPath =[NSIndexPath indexPathForItem:self.selectedList.count-1 inSection:0];
        [collectionView moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
    }
}


#pragma mark - utils

//查询对象插入到原来合适的位置
-(NSInteger) getObjectInListIndex:(TagModel *)m{
    //把m丢到List中，然后排序一下，找到str在List中的位置
    if (m) {
        [self.unSelectedList addObject:m];
        [self.unSelectedList sortUsingComparator:^NSComparisonResult(TagModel *obj1, TagModel *obj2) {
            NSInteger index1 = obj1.index;
            NSInteger index2 = obj2.index;
            return index1 > index2;
        }];
        NSInteger index = [self.unSelectedList indexOfObject:m];
        [self.unSelectedList removeObject:m];
        return index;
    }
    
    return [self.unSelectedList count]+1;
}


//通过text获取tag
-(TagModel *) getObjectInList:(NSString *)str{
    for (TagModel *model in self.originDataList) {
        if ([model.text isEqualToString:str]) {
            return model;
        }
    }
    return nil;
}

//计算cell size
-(CGSize)calculateCellSize:(NSString *)content{
    CGSize size = [content sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(MAXFLOAT, kItemHeight) lineBreakMode:NSLineBreakByCharWrapping];
    size.height = kItemHeight;
    size.width = floorf(size.width+20);
    return size;
}


#pragma mark - getter/setter
-(NSMutableArray *)selectedList{
    if (_selectedList == nil) {
        _selectedList = [[NSMutableArray alloc] init];
    }
    return _selectedList;
}

-(NSMutableArray *)unSelectedList{
    if (_unSelectedList == nil) {
        _unSelectedList = [[NSMutableArray alloc] init];
    }
    return _unSelectedList;
}

-(NSMutableArray *)originDataList{
    if (_originDataList == nil) {
        _originDataList = [[NSMutableArray alloc] init];
    }
    return _originDataList;
}
@end
