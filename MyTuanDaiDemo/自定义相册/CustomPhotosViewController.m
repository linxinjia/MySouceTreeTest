//
//  CustomPhotosViewController.m
//  MyTuanDaiDemo
//
//  Created by linxinjia on 2017/6/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CustomPhotosViewController.h"
#import <Photos/Photos.h>
#import "TZImagePickerController.h"
#import "TZImageManager.h"

@interface CustomPhotosViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,TZImagePickerControllerDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation CustomPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    [self getPhotos];
    [self setUpSuperView];
}

- (void)setUpSuperView{
    
    
    
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}

//获取相册列表
- (void)getPhotos{
    PHFetchOptions *fetchOptions = [[PHFetchOptions alloc] init];
    fetchOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    PHImageRequestOptions *requestOptions = [PHImageRequestOptions new];
    requestOptions.deliveryMode = PHImageRequestOptionsDeliveryModeFastFormat;
    // 列出所有相册智能相册
    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    
    
    // 这时 smartAlbums 中保存的应该是各个智能相册对应的 PHAssetCollection
    for (NSInteger i = 0; i < smartAlbums.count; i++) {
        // 获取一个相册（PHAssetCollection）
        PHCollection *collection = smartAlbums[i];
        if ([collection isKindOfClass:[PHAssetCollection class]]) {
            PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
            NSLog(@"获取到一个相册:%@",assetCollection.localizedLocationNames);
            // 从每一个智能相册中获取到的 PHFetchResult 中包含的才是真正的资源（PHAsset）
            PHFetchResult *assetsFetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:fetchOptions];
            
            PHAsset *assett = assetsFetchResult.count > 0 ? assetsFetchResult[0]:nil;
            NSLog(@"获取到一个照片的Asset:%@",assett);
            [[PHImageManager new] requestImageForAsset:assett targetSize:PHImageManagerMaximumSize contentMode:0 options:requestOptions resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                
                NSLog(@"获取到一个照片:%@",result);
            }];

        }else {
            NSAssert(NO, @"Fetch collection not PHCollection: %@", collection);
        }
    }
    
    
}




#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *reusedCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reusedCell" forIndexPath:indexPath];
    reusedCell.backgroundColor = [UIColor greenColor];

    return reusedCell;
}



//// 给头(尾)添加内容
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    
//    UICollectionReusableView *reusableView = nil;
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
//    {
//        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
//        CGSize size = reusableView.bounds.size;
//        for (UIView * view in reusableView.subviews) {
//            [view removeFromSuperview];
//        }
//        if (indexPath.section == 0) {
//            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, size.height-30, size.width, 20)];
//            label.textAlignment = NSTextAlignmentLeft;
//            label.text = @"热搜";
//            label.font = [UIFont systemFontOfSize:15];
//            [reusableView addSubview:label];
//        }else if(indexPath.section == 1) {
//            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, size.height-30, 20, 20)];
//            imageView.image = [UIImage imageNamed:@"icon_clock.png"];
//            imageView.backgroundColor = [UIColor clearColor];
//            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, size.height-30, size.width, 20)];
//            label.textAlignment = NSTextAlignmentLeft;
//            label.text = @"搜索历史";
//            label.font = [UIFont systemFontOfSize:15];
//            [reusableView addSubview:imageView];
//            [reusableView addSubview:label];
//        }
//    }else {
//    }
//    if (indexPath.section == 0) {
//        reusableView.frame = CGRectZero;
//    }
//    return reusableView;
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self toSelectImagesselectedPhotos:nil maxImagesCount:5];
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    EtpfSearchPageViewCell *searchCell;
//    searchCell = [[EtpfSearchPageViewCell alloc] init];
//    if (indexPath.section == 0) {
//        searchCell.label.text = [NSString stringWithFormat:@" %@ ",hotSearchArray[indexPath.item]];
//    }else {
//        int count = _searchHistoryArray.count;
//        searchCell.label.text = [NSString stringWithFormat:@" %@ ", self.searchHistoryArray[count-indexPath.item-1]];
//    }
//    
//    NSDictionary *attribute = @{NSFontAttributeName:searchCell.label.font};
//    CGSize size = [searchCell.label.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1000.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
//    return CGSizeMake(size.width, size.height*1.5);
    return CGSizeMake(60, 60);
}



- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 20, 0, 20);
}


#pragma mark - action
- (void)toSelectImagesselectedPhotos:(NSMutableArray *)selectedPhotos maxImagesCount:(NSInteger)count{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:count delegate:self];
    
        //设置imagePickerVc的外观
    imagePickerVc.naviBgColor = [UIColor whiteColor];
    imagePickerVc.naviTitleColor = self.navigationController.navigationBar.tintColor;
    imagePickerVc.barItemTextColor = self.navigationController.navigationBar.tintColor;
    imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
    
    
    imagePickerVc.allowTakePicture = NO;
    imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.didFinishPickingPhotosHandle = ^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        NSLog(@"获取到照片");
       
    };
    
    imagePickerVc.title = @"添加图片";
    
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
}



#pragma mark - getters
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"reusedCell"];//cell重用设置ID
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];

        [self.view addSubview:_collectionView];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_collectionView)]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64.5-[_collectionView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_collectionView)]];
    }
    return _collectionView;
}




////获取所有资源
//- (void)getAllPhotos{
//    // 获取所有资源的集合，并按资源的创建时间排序
//    PHFetchOptions *options = [[PHFetchOptions alloc] init];
//    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
//    PHFetchResult *assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
//    // 这时 assetsFetchResults 中包含的，应该就是各个资源（PHAsset）
//    for (NSInteger i = 0; i < assetsFetchResults.count; i++) {
//        // 获取一个资源（PHAsset）
//        PHAsset *asset = assetsFetchResults[i];
//    }
//}
@end
