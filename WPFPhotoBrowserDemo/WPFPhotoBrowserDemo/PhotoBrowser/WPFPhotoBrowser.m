//
//  WPFPhotoBrowser.m
//  WPFPhotoBrowser
//
//  Created by Leon on 2017/4/13.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import "WPFPhotoBrowser.h"

static NSString *const kCollectionViewIdentifier = @"kCollectionViewIdentifier";

@interface WPFPhotoBrowser () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, assign) NSInteger currentIndex;

/** 对于大量图片的创建方法，会传过来需要展示图片的总数 */
@property (nonatomic, assign) NSInteger photoCount;

/** 对于少量图片的创建方法，会传过来需要展示的所有图片的模型数组 */
@property (nonatomic, strong) NSArray *photoArray;

@property (nonatomic, weak) id<WPFPhotoBrowserDelegate> delegate;
@property (nonatomic, weak) id<WPFPhotoBrowserDataSource> dataSource;

@property (nonatomic, weak) UICollectionView *collectionView;

@end



@implementation WPFPhotoBrowser


#pragma mark - initialize method
+ (instancetype)showFromView:(UIView *)fromView
           currentPhotoIndex:(NSInteger)currentIndex
                    delegate:(id<WPFPhotoBrowserDelegate>)delegate
             photoModelBlock:(NSArray *(^)())photoModelBlock {
    
    WPFPhotoBrowser *browser = [[WPFPhotoBrowser alloc] init];
    
    browser.currentIndex = currentIndex;
    browser.delegate = delegate;
    browser.photoArray = photoModelBlock();
    
    return browser;
}

+ (instancetype)showFromView:(UIView *)fromView
           currentPhotoIndex:(NSInteger)currentIndex
                  photoCount:(NSInteger)photoCount
       delegateAndDataSource:(id<WPFPhotoBrowserDelegate, WPFPhotoBrowserDataSource>)delegate {
    
    WPFPhotoBrowser *browser = [[WPFPhotoBrowser alloc] init];
    
    browser.currentIndex = currentIndex;
    browser.delegate = delegate;
    browser.dataSource = delegate;
    browser.photoCount = photoCount;
    
    return browser;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        CGFloat kScreenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat kScreenHeight = [UIScreen mainScreen].bounds.size.height;
        
        // 初始化 CollectionView
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
        layout.minimumLineSpacing = 10;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:layout];
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCollectionViewIdentifier];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        [self addSubview:collectionView];
        _collectionView = collectionView;
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // 对于两种创建方法所做的数据源区分
    if (self.photoArray) {
        return self.photoArray.count;
    }
    return self.photoCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewIdentifier forIndexPath:indexPath];
    //    cell
    
    return cell;
}




#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

@end
