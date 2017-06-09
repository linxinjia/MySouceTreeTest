//
//  CustomPhotosViewController.m
//  MyTuanDaiDemo
//
//  Created by linxinjia on 2017/6/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CustomPhotosViewController.h"
#import <Photos/Photos.h>

@interface CustomPhotosViewController ()

@end

@implementation CustomPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self getPhotos];

}

//相册
- (void)getPhotos{
//    // 列出所有相册智能相册
//    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
//    // 这时 smartAlbums 中保存的应该是各个智能相册对应的 PHAssetCollection
//    for (NSInteger i = 0; i < smartAlbums.count; i++) {
//        // 获取一个相册（PHAssetCollection）
//        PHCollection *collection = smartAlbums[i];
//        if ([collection isKindOfClass:[PHAssetCollection class]]) {
//            PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
//            // 从每一个智能相册中获取到的 PHFetchResult 中包含的才是真正的资源（PHAsset）
//            PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:fetchOptions];
//        }else {
//            NSAssert(NO, @"Fetch collection not PHCollection: %@", collection);
//        }
//    }
//    
//    // 获取所有资源的集合，并按资源的创建时间排序
//    PHFetchOptions *options = [[PHFetchOptions alloc] init];
//    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
//    PHFetchResult *assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
//    // 这时 assetsFetchResults 中包含的，应该就是各个资源（PHAsset）
//    for (NSInteger i = 0; i < fetchResult.count; i++) {
//        // 获取一个资源（PHAsset）
//        PHAsset *asset = fetchResult[i];
//    }
}



@end
