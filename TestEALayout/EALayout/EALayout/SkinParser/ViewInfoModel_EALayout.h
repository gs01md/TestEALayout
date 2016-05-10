//
//  ViewInfoModel_EALayout.h
//  EALayout
//
//  关联：
//  创建的视图 和 名称
//
//  Created by Simon on 16/5/10.
//  Copyright © 2016年 easylayout. All rights reserved.
//



#ifndef ViewInfoModel_EALayout_h
#define ViewInfoModel_EALayout_h

#import <UIKit/UIKit.h>

@interface ViewInfoModel_EALayout: NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIView *view;

@end


@implementation ViewInfoModel_EALayout
@end
#endif /* ViewInfoModel_EALayout_h */
