//
//  SearchViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchDetailViewController.h"
@interface SearchViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView* webView;
@end

@implementation SearchViewController
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"搜索";
    }return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *str= @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    // Do any additional setup after loading the view.
}
-(UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
        [self.view addSubview:_webView];
        _webView.delegate=self;
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
       
    } return _webView;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *str= @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView";
    if (![request.URL.absoluteString isEqualToString:str]) {
        SearchDetailViewController *vc = [[SearchDetailViewController alloc]initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
