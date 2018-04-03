//
//  DetailViewController.m
//  Json解析
//
//  Created by  Ron on 2018/3/25.
//  Copyright © 2018年  Ron. All rights reserved.
//

#import "DetailViewController.h"

#import "Header.h"

@interface DetailViewController ()
@property (nonatomic,strong) UITableView * textView;
@property (nonatomic,strong) UIImageView * headImgView;
@property (nonatomic,strong) id<UIWebViewDelegate> webDelegate;
@end

@implementation DetailViewController
-(instancetype)initWithID:(NSString*)Id{
    if (self = [super init]) {
        self.idNum = Id;
    }
    return self;
}
+(instancetype)shareViewController:(NSString*)idNum{
    static DetailViewController * static_controller;
    if (static_controller==nil) {
        static_controller = [[DetailViewController alloc]initWithID:idNum];
        UIWebView * webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//        webView.backgroundColor = [UIColor blueColor];
        webView.delegate = static_controller.webDelegate;
        webView.scalesPageToFit = YES;
        static_controller.view = webView;
    }
    static_controller.idNum = idNum;
    return static_controller;
}
-(void)loadData_fun{
    //字符串拼接：
    NSString * current = @SEC_URL;
    NSString * current1 = [current stringByAppendingString:self.idNum];
    //得到url：
    NSURL * secUrl = [NSURL URLWithString:current1];
    //NSURLSession异步访问：
    NSURLSession* session = [NSURLSession sharedSession];
    //    __block UIView * view = NULL;
    NSURLSessionDataTask * task = [session dataTaskWithURL:secUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary * dic = (NSDictionary*)obj;
            NSString * body = [dic objectForKey:@"body"];
            dispatch_async(dispatch_get_main_queue(), ^{
                UIWebView * w = (UIWebView*)self.view;
                [w loadHTMLString:body baseURL:nil];
            });
            NSLog(@"%@",self.idNum);
        }else{
            NSLog(@"Arr");
        }
    }];
    [task resume];
}
-(void)viewDidLoad{
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:nil];
    [self loadData_fun];
    [self.view reloadInputViews];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:nil];
    UIWebView * w = (UIWebView*)self.view;
    [w loadHTMLString:@"" baseURL:nil];
    [self.view reloadInputViews];
}
@end
