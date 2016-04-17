//
//  HttpRequestTool.h
//  仿shipin
//
//  Created by yan on 16/4/16.
//  Copyright © 2016年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^SucessBlock)(NSArray *videoListArray,NSArray *videoSidListArray);

typedef void(^FailureBlock)(NSError *error);

@interface HttpRequestTool : NSObject



+(id)shareHttpTool;

-(void)getRequestWithUrl:(NSString *)url Sucess:(SucessBlock)sucessBlock error:(FailureBlock)errorBlock;

@end
