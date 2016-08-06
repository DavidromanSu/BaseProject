//
//  TuWanListViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanListCell.h"
#import "TuWanViewModel.h"
#import "TuWanImageCell.h"
#import "iCarousel.h"
#import "TuWanHTMLViewController.h"
#import "TuWanPicViewController.h"
@interface TuWanListViewController()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)TuWanViewModel *tuwanVM;

@end
@implementation TuWanListViewController
{   iCarousel *_ic;
    UIPageControl *_pageController;
    UILabel *_titleLb;
    NSTimer *_timer;
    
}
-(UIView*)HeaderView{
    [_timer invalidate];
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750*500)];
    if (![self.tuwanVM isExistIndexPic]) {
        return nil;
    }
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor=kRGBColor(240, 240, 240);
    [headerView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(35);
        make.left.right.bottom.mas_equalTo(0);
    }];
    _titleLb = [UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageController =[UIPageControl new];
    _pageController.numberOfPages=self.tuwanVM.indexPicNumber;
    _pageController.hidesForSinglePage=YES;
    _pageController.currentPageIndicatorTintColor= [UIColor greenColor];
    _pageController.userInteractionEnabled = NO;
    [bottomView addSubview:_pageController];
    [_pageController mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(10);
        
    }];
    _titleLb.text=[self.tuwanVM titleForRowInIndexPic:0];
    _ic = [iCarousel new];
    [headerView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.left.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate=self;
    _ic.dataSource=self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed=1;
    _ic.scrollEnabled=[self.tuwanVM indexPicNumber]!=1;
    if (self.tuwanVM.indexPicNumber>1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    return headerView;
}
#pragma mark-iCarousel
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([self.tuwanVM isHTMLInIndexPicForRow:index]) {
        TuWanHTMLViewController *vc = [[TuWanHTMLViewController alloc]initWithURL:[self.tuwanVM detailURLForRowInIndexPic:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.tuwanVM isPicInIndexPicForRow:index]) {
        TuWanPicViewController *vc = [[TuWanPicViewController alloc]initWithAid:[self.tuwanVM aidForRowInIndexPicForRow:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.tuwanVM.indexPicNumber;
}
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _titleLb.text = [self.tuwanVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageController.currentPage = carousel.currentItemIndex;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW,kWindowW/750*500-35)];
        UIImageView *imageView=[UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView*)[view viewWithTag:100];
    [imageView setImageWithURL:[self.tuwanVM iconURLForRowInIndexPic:index]];
    return view;
}
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option==iCarouselOptionWrap) {
        return YES;
    }
    return value; 
}
-(TuWanViewModel *)tuwanVM{
    if (_tuwanVM == nil) {
        _tuwanVM = [[TuWanViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _tuwanVM;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tuwanVM refreshDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self HeaderView];
            [self.tableView.header endRefreshing];
              [self.tableView reloadData];
        }];
      
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self HeaderView];
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tuwanVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.tuwanVM containImages:indexPath.row]) {
        TuWanImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
        cell.titleLb.text = [self.tuwanVM titleForRowInList:indexPath.row];
        cell.clickNumberLb.text = [self.tuwanVM clickForRowInList:indexPath.row];
        [cell.iconIV0.imageView setImageWithURL:[self.tuwanVM iconsURLForRowInList:indexPath.row][0]placeholderImage:[UIImage imageNamed:@"a4816418"]];
        [cell.iconIV1.imageView setImageWithURL:[self.tuwanVM iconsURLForRowInList:indexPath.row][1]placeholderImage:[UIImage imageNamed:@"a4816418"]];
        [cell.iconIV2.imageView setImageWithURL:[self.tuwanVM iconsURLForRowInList:indexPath.row][2]placeholderImage:[UIImage imageNamed:@"a4816418"]];
        return cell;
        
    }else{
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    [cell.iconIV.imageView setImageWithURL:[self.tuwanVM iconURLForRowInList:indexPath.row]];
    cell.titleLB.text = [self.tuwanVM titleForRowInList:indexPath.row];
    cell.longTitleLB.text = [self.tuwanVM descForRowInList:indexPath.row];
        cell.clickNumLB.text = [self.tuwanVM clickForRowInList:indexPath.row];
        return cell;}
}
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.tuwanVM isHTMLInListForRow:indexPath.row]) {
        TuWanHTMLViewController *vc = [[TuWanHTMLViewController alloc]initWithURL:[self.tuwanVM detailURLForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.tuwanVM isPicInListForRow:indexPath.row]) {
        TuWanPicViewController *vc = [[TuWanPicViewController alloc]initWithAid:[self.tuwanVM aidForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.tuwanVM containImages:indexPath.row]?135:90;
}
@end
