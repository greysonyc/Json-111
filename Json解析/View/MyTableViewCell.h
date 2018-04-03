//
//  myTableViewCell.h
//  Json解析
//
//  Created by  Ron on 2018/3/26.
//  Copyright © 2018年  Ron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentsInCell.h"
@interface MyTableViewCell : UITableViewCell
@property (nonatomic,strong) ContentsInCell * contentsInCell_mine;
@property (nonatomic,strong) UIImageView * myImgView;
@property (nonatomic,strong) UILabel * myText;
//@property  void (^rtBlock)(CGFloat cellHeight);
+(instancetype)shareMyCell;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
