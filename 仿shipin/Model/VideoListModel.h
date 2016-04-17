//
//  VideoListModel.h
//  仿shipin
//
//  Created by yan on 16/4/16.
//  Copyright © 2016年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoListModel : NSObject
@property (nonatomic , copy) NSString *topicImg;

@property (nonatomic , assign) NSInteger replyCount;

@property (nonatomic , copy) NSString *videosource;

@property (nonatomic , copy) NSString *mp4Hd_url;

@property (nonatomic , copy) NSString *topicDesc;

@property (nonatomic , copy) NSString *topicSid;

@property (nonatomic , copy) NSString *cover;

@property (nonatomic , copy) NSString *title;

@property (nonatomic , assign) NSInteger playCount;

@property (nonatomic , copy) NSString *replyBoard;

@property (nonatomic , strong) NSDictionary *videoTopic;
/*
 alias": "爱情象鬼：信的人多见到的人少",
 "tname": "bugs",
 "ename": "T1460515712933",
 "tid": "T1460515712933"
 */

@property (nonatomic , copy) NSString *sectiontitle;

@property (nonatomic , copy) NSString *descriptionStr;

@property (nonatomic , copy) NSString *replyid;

@property (nonatomic , copy) NSString *mp4_url;

@property (nonatomic , assign) NSInteger length;

@property (nonatomic , assign) NSInteger playersize;

@property (nonatomic , copy) NSString *vid;

@property (nonatomic , copy) NSString *m3u8_url;

@property (nonatomic , copy) NSString *ptime;

@property (nonatomic , copy) NSString *topicName;


@end
