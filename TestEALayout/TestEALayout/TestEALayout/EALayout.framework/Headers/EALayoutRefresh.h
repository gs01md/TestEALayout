//
//  EALayoutRefresh.h
//  EALayout
//
//  封装刷新界面功能
//
//  Created by Simon on 16/5/9.
//  Copyright © 2016年 easylayout. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EALayoutRefreshDelegate <NSObject>

@optional
- (void) refreshEALayout;

@end

@interface EALayoutRefresh : NSObject

@property (weak,nonatomic) id<EALayoutRefreshDelegate> delegate;


+(id)shareInstance;

@end
