//
//  DetailViewController.h
//  Json解析
//
//  Created by  Ron on 2018/3/25.
//  Copyright © 2018年  Ron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic,strong) NSString * idNum;

+(instancetype)shareViewController:(NSString*)idNum;
@end
