//
//  TuWanHTMLViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanHTMLViewController.h"
@interface TuWanHTMLViewController()<UIWebViewDelegate>
@property(strong,nonatomic)UIWebView* webView;

@end
@implementation TuWanHTMLViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [Factory addBackItemToVC:self];
}

- (UIWebView *)webView {
	if(_webView == nil) {
		_webView = [[UIWebView alloc] init];
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        _webView.delegate=self;
	}
	return _webView;
}
-(id)initWithURL:(NSURL *)url{
    if ([super init]) {
        self.url=url;
    }
    return self;
}
#pragma mark-UIWebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
}
@end
