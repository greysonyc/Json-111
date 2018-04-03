//
//  myTableViewCell.m
//  Json解析
//
//  Created by  Ron on 2018/3/26.
//  Copyright © 2018年  Ron. All rights reserved.
//

#import "MyTableViewCell.h"
#import "Masonry.h"
@implementation MyTableViewCell

+(instancetype)shareMyCell{
    static MyTableViewCell * myCell;
    if (myCell==nil) {
        
        [myCell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(myCell.superview.mas_left).offset(20);
            make.right.mas_equalTo(myCell.superview.mas_right).offset(-20);
            make.height.mas_equalTo(40);
        }];
    }
    return myCell;
}
//-(void)setContentsInCell_mine:(ContentsInCell *)contentsInCell_mine{
//    self.myImgView.image = [UIImage imageWithData:contentsInCell_mine.img];
//    self.myText.text = contentsInCell_mine.title;
//}
-(void)loadModels{
    self.myImgView.image = [UIImage imageWithData:self.contentsInCell_mine.img];
    self.myText.text = self.contentsInCell_mine.title;
}
-(void)layoutSubviews{
    [super layoutSubviews];
//    NSLog(@"layoutSubviews");
//    NSLog(@"content address is %@",self.contentsInCell_mine);
    self.myImgView.frame = self.contentsInCell_mine.imgFrame;
    self.myText.frame = self.contentsInCell_mine.textFrame;
    
    [self loadModels];
}
-(instancetype)init{
    if (self = [super init]) {
        self.myText = [[UILabel alloc]init];
        self.myText.font = [UIFont systemFontOfSize:17];
        self.myText.numberOfLines = 0;
        [self.myText sizeToFit];
        
        [self.contentView addSubview:self.myText];
        //        self.myText.backgroundColor = [UIColor blueColor];
        self.myImgView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.myImgView];
    }
    return self;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.myText = [[UILabel alloc]init];
        self.myText.font = [UIFont systemFontOfSize:17];
        self.myText.numberOfLines = 0;
        [self.myText sizeToFit];
        
        [self.contentView addSubview:self.myText];
//        self.myText.backgroundColor = [UIColor blueColor];
        self.myImgView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.myImgView];
    }
    return self;
}

@end
