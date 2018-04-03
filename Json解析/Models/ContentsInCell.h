//
//  ContentsInCell.h
//  Json解析
//
//  Created by  Ron on 2018/3/24.
//  Copyright © 2018年  Ron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentsInCell : NSObject
@property NSString * title;
@property NSData * img;
@property NSString * idNum;

@property CGRect imgFrame;
@property CGRect textFrame;
@property (nonatomic,assign) CGFloat cellHeight_returns;
-(instancetype)initWithImge:(id)img andTitle:(NSString*)title andIdNum:(NSString*)idNum;
@end
