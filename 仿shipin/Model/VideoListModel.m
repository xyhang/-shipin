//
//  VideoListModel.m
//  仿shipin
//
//  Created by yan on 16/4/16.
//  Copyright © 2016年 yan. All rights reserved.
//

#import "VideoListModel.h"

@implementation VideoListModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        self.descriptionStr = value;
    }
}

@end
