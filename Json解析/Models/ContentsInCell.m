//
//  ContentsInCell.m
//  Json解析
//
//  Created by  Ron on 2018/3/24.
//  Copyright © 2018年  Ron. All rights reserved.
//

#import "ContentsInCell.h"

@implementation ContentsInCell
-(CGFloat)cellHeight_returns{
    if (_cellHeight_returns==0) {
//        ContentsInCell * contentInHeight = self.arr[indexPath.row];
        //myimgview;
        CGFloat space = 5;
        CGFloat imgView_wid_heit = 60;
        CGFloat imgView_x = space;
        CGFloat imgView_y = space;
        self.imgFrame = CGRectMake(imgView_x, imgView_y, imgView_wid_heit, imgView_wid_heit);
        //myText:
        CGFloat txt_x = CGRectGetMaxX(self.imgFrame)+space;
        CGFloat txt_y = imgView_y;
        CGFloat txt_wid = [UIScreen mainScreen].bounds.size.width-imgView_wid_heit-space*3;
        CGSize txt_Size = CGSizeMake(txt_wid, MAXFLOAT);
        //计算文字大小：
        NSDictionary * attr_txt = @{NSFontAttributeName :[UIFont systemFontOfSize:17]};
//        CGSize txt_size = [self.title sizeWithAttributes:attr_txt];
        CGFloat txt_hei = [self.title boundingRectWithSize:txt_Size options:NSStringDrawingUsesLineFragmentOrigin attributes:attr_txt context:nil].size.height;
        self.textFrame = CGRectMake(txt_x, txt_y, txt_wid, txt_hei);
        //计算heightOfCell：
        _cellHeight_returns = CGRectGetMaxY(self.imgFrame)+space;
    }
    return _cellHeight_returns;
}
-(instancetype)initWithImge:(id)img andTitle:(NSString*)title andIdNum:(NSString*)idNum {
    if (self = [super init]) {
        NSString * str = img[0];
        NSURL * url = [NSURL URLWithString:str];
        NSData * imgData = [NSData dataWithContentsOfURL:url];
        self.img = imgData;
        self.title = title;
        self.idNum = idNum;
    }
    return self;
}
@end
