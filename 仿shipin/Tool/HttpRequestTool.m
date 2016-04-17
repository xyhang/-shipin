//
//  HttpRequestTool.m
//  仿shipin
//
//  Created by yan on 16/4/16.
//  Copyright © 2016年 yan. All rights reserved.
//

#import "HttpRequestTool.h"
#import "VideoSidListModel.h"
@implementation HttpRequestTool

+(id)shareHttpTool{
    static HttpRequestTool *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HttpRequestTool alloc]init];
    });
    return instance;
}

-(void)getRequestWithUrl:(NSString *)url Sucess:(SucessBlock)sucessBlock error:(FailureBlock)errorBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSArray *videoSidListArr = [responseObject objectForKey:@"videoSidList"];
        NSArray *videoListArr = [responseObject objectForKey:@"videoList"];
        NSLog(@"%@",videoSidListArr);
        NSMutableArray *videoSidMuArr = [NSMutableArray array];
        for (NSDictionary *dict in videoSidListArr) {
            VideoSidListModel *model = [[VideoSidListModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [videoSidMuArr addObject:model];
        }
        NSMutableArray *videoListMuArray = [NSMutableArray array];
        for (NSDictionary *dict in videoListArr) {
            VideoListModel *model = [[VideoListModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [videoListMuArray addObject:model];
        }
        sucessBlock(videoListMuArray,videoSidMuArr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

@end
