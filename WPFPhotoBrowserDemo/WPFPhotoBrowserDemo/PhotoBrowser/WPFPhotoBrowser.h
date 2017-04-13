//
//  WPFPhotoBrowser.h
//  WPFPhotoBrowser
//
//  Created by Leon on 2017/4/13.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPFPhotoModel.h"

@protocol WPFPhotoBrowserDelegate <NSObject>



@end

@protocol WPFPhotoBrowserDataSource <NSObject>



@end

@interface WPFPhotoBrowser : UIView





/**
 *  少量图片推荐的构建方法：直接将数据源传过来，但是大量图片情况下推荐下面构建方法
 *
 *  fromView : 图片浏览器所属的父view
 *  currentIndex : 当前显示的图片的索引
 *  photoModelBlock : 返回一个模型数组，包含需要显示的所有图片信息
 */
+ (instancetype)showFromView:(UIView *)fromView
           currentPhotoIndex:(NSInteger)currentIndex
                    delegate:(id<WPFPhotoBrowserDelegate>)delegate
             photoModelBlock:(NSArray *(^)())photoModelBlock;

/**
 *  大量图片的构建方法 : 通过数据源方法返回，比如一百张图片都需要加入队列，但是没必要一次传过来，因为用户可能只看一张就关掉了
 *
 *  fromView : 图片浏览器所属的父view
 *  currentIndex : 当前显示的图片的索引
 *  photoCount : 需要展示的图片总数
 */
+ (instancetype)showFromView:(UIView *)fromView
           currentPhotoIndex:(NSInteger)currentIndex
                  photoCount:(NSInteger)photoCount
       delegateAndDataSource:(id<WPFPhotoBrowserDelegate, WPFPhotoBrowserDataSource>)delegate;

@end
