//
//  RootTableViewCell.h
//  仿shipin
//
//  Created by yan on 16/4/16.
//  Copyright © 2016年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMGAVPlayer/FMGVideoPlayView.h"
@interface RootTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel          * title;
@property (nonatomic, strong) UILabel          * descriptionLabel;
@property (nonatomic, strong) FMGVideoPlayView * playerView;
@property (nonatomic, strong) UIImageView      * timeImage;
@property (nonatomic, strong) UILabel          * timeLabel;
@property (nonatomic, strong) UIImageView      * playCountImage;
@property (nonatomic, strong) UILabel          * playCountLabel;
@property (nonatomic, strong) UIButton         * replyButton;
@property (nonatomic, strong) UIButton         * shareButton;
@property (nonatomic, strong) UIImageView      * backImage;
@property (nonatomic, strong) UIButton         * playButton;

@property (nonatomic, strong) VideoListModel            * video;

@end
