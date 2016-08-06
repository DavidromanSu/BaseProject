//
//  TuWanPicViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#import "TuWanPicViewModel.h"
#import "TuWanPicViewController.h"
@interface TuWanPicViewController()<MWPhotoBrowserDelegate>
@property(nonatomic,strong)TuWanPicViewModel* picVM;

@end
@implementation TuWanPicViewController
-(TuWanPicViewModel *)picVM{
    if (!_picVM) {
        _picVM=[[TuWanPicViewModel alloc]initWithAid:self.aid];
    }return _picVM;
}
-(id)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        self.aid = aid;
    }return self;
}
-(instancetype)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWithAid", __func__);
    }return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [Factory addBackItemToVC:self];
    [self showProgress];
    [self.picVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self hideProgress];
        MWPhotoBrowser *photo = [[MWPhotoBrowser alloc]initWithDelegate:self];
        NSMutableArray *naviVCs =[NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        [naviVCs removeLastObject];
        [naviVCs addObject:photo];
        self.navigationController.viewControllers = naviVCs;
        
        
    }];
}
-(NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return [self.picVM rowNumber];
    
}
-(id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto *photo = [MWPhoto photoWithURL:[self.picVM picURLForRow:index]];
    return photo;
}
@end
