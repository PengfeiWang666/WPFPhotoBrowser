//
//  DemoMainViewController.m
//  WPFPhotoBrowser
//
//  Created by Leon on 2017/3/25.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import "DemoMainViewController.h"

static NSString *const kCellIdntifier = @"kCellIdntifier";

@interface DemoMainViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *dataSourceArr;

@end

@implementation DemoMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"WPFPhotoBrowser";
    
    [self setupCollectionView];
    
    
    
}

- (void)setupCollectionView {
    // 初始化布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置布局
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.itemSize = CGSizeMake(100, 100);  // cell的尺寸
    layout.minimumLineSpacing = 20;          // cell之间的水平间距
    layout.minimumInteritemSpacing = 10;     // cell之间的垂直间距
    
    // 初始化collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellIdntifier];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    // 添加到视图当中
    [self.view addSubview:_collectionView];
}

- (NSArray *)dataSourceArr {
    if (!_dataSourceArr) {
        _dataSourceArr = @[
                           @"http://wx1.sinaimg.cn/mw1024/c260f7ably1fddbwcdw4oj21b90vb4a3.jpg",
                           @"http://wx3.sinaimg.cn/mw1024/c260f7ably1fddbwe1w8jj219d0pjtf6.jpg",
                           @"http://wx2.sinaimg.cn/mw1024/c260f7ably1fddbwheunxj21kw1kw1kx.jpg",
                           @"http://wx1.sinaimg.cn/mw1024/c260f7ably1fddbwjwqdrj22c01jnkjl.jpg",
                           @"http://wx2.sinaimg.cn/mw1024/c260f7ably1fddbwnf1bsj22at1alu0y.jpg",
                           @"http://wx3.sinaimg.cn/mw1024/c260f7ably1fdb2qkt16hj20hs0k1ncg.jpg",
                           @"http://wx4.sinaimg.cn/mw1024/c260f7ably1fdb2qfk9hrj20hs0ywdq6.jpg",
                           @"http://wx2.sinaimg.cn/mw1024/c260f7ably1fdb2qntapkj20hs0k149f.jpg",
                           @"http://wx3.sinaimg.cn/mw1024/c260f7ably1fdb2qssvn4j21no2bi4qp.jpg",
                           @"http://wx2.sinaimg.cn/mw1024/c260f7ably1fdb2qyznrwj22bx1b71kx.jpg",
                           @"http://wx2.sinaimg.cn/mw1024/c260f7ably1fdb2r19fnkj20hs0k1dr1.jpg",
                           @"http://wx3.sinaimg.cn/mw1024/c260f7ably1fdb2r3efnej21od0xy7d1.jpg",
                           
                           @"http://ww4.sinaimg.cn/mw1024/c260f7abjw1fa3g7xo1t5j20y019c7d4.jpg",
                           @"http://ww1.sinaimg.cn/mw1024/c260f7abjw1fa1at3v5f6j20qo0zkdmg.jpg",
                           @"http://ww4.sinaimg.cn/mw1024/c260f7abjw1f9ue9mz5sfj21lx2hoe82.jpg",
                           @"http://ww3.sinaimg.cn/mw1024/c260f7abjw1f9ue7e4f2lj20zk0npq4l.jpg",
                           @"http://ww3.sinaimg.cn/mw1024/c260f7abjw1f9ue9oaj6qj20zk0npta7.jpg",
                           @"http://ww2.sinaimg.cn/mw1024/c260f7abjw1f9ueahpjy8j20qo0zkgrp.jpg",
                           @"http://ww1.sinaimg.cn/mw1024/c260f7abjw1f9uebptrppj22io1w0npd.jpg",
                           @"http://ww4.sinaimg.cn/mw1024/c260f7abgw1f9s08cjwfnj20qo0ubwq0.jpg",
                           @"http://ww2.sinaimg.cn/mw1024/c260f7abgw1f9s088x59sj21400qo46t.jpg",
                           
                           @"http://ww1.sinaimg.cn/mw1024/c260f7abjw1f9bq2bpsntj20qo0qoaf4.jpg",
                           @"http://ww4.sinaimg.cn/mw1024/c260f7abgw1f9bq1com1vj20zk0qodl0.jpg",
                           @"http://ww2.sinaimg.cn/mw1024/c260f7abgw1f9bq1bghypj20qo0zkk46.jpg",
                           @"http://ww2.sinaimg.cn/mw1024/c260f7abgw1f95wmiaru5j20qo0zk7dz.jpg",
                           @"http://ww1.sinaimg.cn/mw1024/c260f7abjw1f95nitg45uj21n21n2e82.jpg",
                           @"http://ww1.sinaimg.cn/mw1024/c260f7abjw1f8t2l1iy9ij24802tce82.jpg",
                           @"http://ww4.sinaimg.cn/mw1024/c260f7abjw1f8t2kx1n80j21p32jmb29.jpg",
                           @"http://ww2.sinaimg.cn/mw1024/c260f7abjw1f8t2les1ddj20u0140hdt.jpg",
                           @"http://ww4.sinaimg.cn/mw1024/c260f7abjw1f8t2l5s0poj24802tc1ky.jpg",
                           @"http://ww4.sinaimg.cn/mw1024/c260f7abjw1f8t2kuw8u5j22tc480x6w.jpg",
                           @"http://ww2.sinaimg.cn/mw1024/c260f7abjw1f8t2lc49iyj22hi3q8hdt.jpg",
                           @"http://ww3.sinaimg.cn/mw1024/c260f7abjw1f8t2l8smctj21hc0zkx6p.jpg",
                           @"http://ww3.sinaimg.cn/mw1024/c260f7abjw1f8t2kigxauj22l43vnb2a.jpg",
                           
                           ];
    }
    return _dataSourceArr;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdntifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}


/**
 / 拖动手势
 - (void)panGestureAction:(UIPanGestureRecognizer *)pan {
 //    self.backgroundColor = [UIColor redColor];
 //    CGPoint nowLoction = [pan locationInView:self];
 ////    NSLog(@"%f============%f", nowLoction.x, nowLoction.y);
 //    _attachmengt.anchorPoint = nowLoction;
 ////    self.collectionView.center = nowLoction;
 //
 //    CGFloat distanceX = nowLoction.x - self.panFirstLocation.x;
 //    CGFloat distanceY = nowLoction.y - self.panFirstLocation.y;
 //
 //    CGFloat newCenterX = [UIScreen mainScreen].bounds.size.width / 2 + distanceX;
 //    CGFloat newCenterY = [UIScreen mainScreen].bounds.size.height / 2 + distanceY;
 //
 ////    self.collectionView.center = CGPointMake(newCenterX, newCenterY);
 //
 //
 //    [self setNeedsDisplay];
 //
 //    CGFloat scale = (nowLoction.y - self.panFirstLocation.y) / [UIScreen mainScreen].bounds.size.height;
 ////    NSLog(@"%f", scale);
 //
 }
 //
 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
 //
 //    if ([gestureRecognizer isMemberOfClass:[UIPanGestureRecognizer class]]) {
 //
 //        CGPoint nowLoction = [gestureRecognizer locationInView:self];
 //        //    NSLog(@"%f============%f", nowLoction.x, nowLoction.y);
 //        _attachmengt.anchorPoint = nowLoction;
 //        //    self.collectionView.center = nowLoction;
 //
 //        CGFloat distanceX = nowLoction.x - self.panFirstLocation.x;
 //        CGFloat distanceY = nowLoction.y - self.panFirstLocation.y;
 //        NSLog(@"distanceY===>%d", distanceY);
 //        if (distanceY < 0) {
 return NO;
 }
 //
 //
 ////        CGPoint test = [gestureRecognizer locationInView:self];
 ////
 ////        // 添加附着行为
 ////        _attachmengt = [[UIAttachmentBehavior alloc] initWithItem:self.collectionView attachedToAnchor:CGPointMake(100, 100)];
 ////        // 初始化仿真者
 ////        UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
 ////        [animator addBehavior:_attachmengt];
 //
 //
 //
 //    }
 //    NSLog(@"sss");
 //    return YES;
 //}
 //
 //- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
 //
 //    if ([gestureRecognizer isMemberOfClass:[UIPanGestureRecognizer class]]) {
 //        self.panFirstLocation = [gestureRecognizer locationInView:self];
 //    }
 //    
 //    return YES;
 //}

 */





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
