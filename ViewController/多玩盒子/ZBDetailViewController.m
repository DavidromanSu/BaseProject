//
//  ZBDetailViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//
//#import "TRImageView.h"
//@interface ZBItemcell : UICollectionViewCell
//@property(nonatomic,strong)TRImageView *icon;
//@property(nonatomic,strong)UILabel *itemName;
//
//@end
//
//@implementation ZBItemcell
//
//-(TRImageView *)icon{
//    if (!_icon) {
//        _icon = [TRImageView new];
//        [self.contentView addSubview:_icon];
//        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.right.mas_equalTo(0);
//            make.height.mas_equalTo(_icon.mas_width);
//        }];
//        
//    }return _icon;
//}
//-(UILabel *)itemName{
//    if (!_itemName) {
//        _itemName=[[UILabel alloc]init];
//        _itemName.font = [UIFont systemFontOfSize:11];
//        _itemName.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:_itemName];
//        [_itemName mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.bottom.right.mas_equalTo(0);
//        }];
//
//    }
//    return _itemName;
//}
//
//@end
//
//
//#import "ZBDetailViewController.h"
//#import "ZBDetailViewModel.h"
//
//@interface ZBDetailViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//@property(nonatomic,strong)UICollectionView *collectionView;
//@property(nonatomic,strong)ZBDetailViewModel *VM;
//@end
//
//@implementation ZBDetailViewController
//#pragma mark-UICollectionViewDataSource
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return [self.VM rowNumber];
//}
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    ZBItemcell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    [cell.icon.imageView setImageWithURL:[self.VM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
//    cell.itemName.text = [self.VM itemNameForRow:indexPath.row];
//    
//    return cell;
//}
//#pragma mark-UICollectionViewDelegateFlowLayout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    CGFloat width = (kWindowW - 5 * 20) / 4;
//    CGFloat height = width + 17;
//    return CGSizeMake(width, height);
//}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(5, 20, 5, 20);
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 5;
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 20;
//}
//
//-(id)initWithTag:(NSString *)tag name:(NSString *)name{
//    if (self = [super init]) {
//        self.tag = tag;
//        self.title = name;
//    }return self;
//}
//-(UICollectionView *)collectionView{
//    if (!_collectionView) {
//        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
//        [self.view addSubview:_collectionView];
//        _collectionView.delegate=self;
//        _collectionView.dataSource = self;
//    
//        _collectionView.backgroundColor=[UIColor whiteColor];
//        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(0);
//        }];
//        [self.VM getDataFromNetCompleteHandle:^(NSError *error) {
//            [_collectionView reloadData];
//        }];
//        [_collectionView registerClass:[ZBItemcell class] forCellWithReuseIdentifier:@"cell"];
//    }return _collectionView;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [Factory addBackItemToVC:self];
//    [self.collectionView reloadData];
//    // Do any additional setup after loading the view.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//- (ZBDetailViewModel *)VM {
//	if(_VM == nil) {
//		_VM = [[ZBDetailViewModel alloc]initWithTag:self.tag];
//	}
//	return _VM;
//}
//
//@end

#import "ZBDetailViewController.h"
#import "ZBDetailViewModel.h"
#import "TRImageView.h"

@interface ZBItemCell : UICollectionViewCell
@property(nonatomic,strong) TRImageView *iconView;
@property(nonatomic,strong) UILabel *nameLb;
@end
@implementation ZBItemCell
- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:11];
        _nameLb.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
        }];
    }
    return _nameLb;
}

- (TRImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(_iconView.mas_width);
        }];
    }
    return _iconView;
}
@end

@interface ZBDetailViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) ZBDetailViewModel *itemVM;
@end

@implementation ZBDetailViewController

- (id)initWithTag:(NSString *)tag name:(NSString *)name{
    if (self = [super init]) {
        self.tag = tag;
        self.title = name;
        [Factory addBackItemToVC:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.collectionView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemVM.rowNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconView.imageView setImageWithURL:[self.itemVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.nameLb.text = [self.itemVM itemNameForRow:indexPath.row];
    return cell;
}
#pragma mark - UICollectionViewDataDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - UICollectionViewDelegateFlowLayout
/** section的上下左右边距 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}
/** 最小行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
/** 最小列间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
/** 每格cell的 宽高 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 5 * 20) / 4;
    CGFloat height = width + 17;
    return CGSizeMake(width, height);
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (ZBDetailViewModel *)itemVM {
    if(_itemVM == nil) {
        _itemVM = [[ZBDetailViewModel alloc] initWithTag:self.tag];
    }
    return _itemVM;
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.itemVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.header endRefreshing];
            }];
        }];
        [_collectionView registerClass:[ZBItemCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}



@end
