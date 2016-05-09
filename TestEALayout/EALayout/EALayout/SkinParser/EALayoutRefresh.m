//
//  EALayoutRefresh.m
//  EALayout
//
//  Created by Simon on 16/5/9.
//  Copyright © 2016年 easylayout. All rights reserved.
//

#import "EALayoutRefresh.h"

@interface EALayoutRefresh (){
    
    NSTimer* m_timer;
}

@end

@implementation EALayoutRefresh

static EALayoutRefresh * shareEALayout = nil;

+(id)shareInstance {
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        shareEALayout = [[self alloc] init];
        
        [shareEALayout refresh];
    });
    
    return shareEALayout;
}

- (void) refresh {
    
    [self createTimer];
    
    if([self.delegate respondsToSelector:@selector(refreshEALayout)]){
        
        [self.delegate refreshEALayout];
    }
    
}


- (void) createTimer {
    
    if (!m_timer) {
    
        NSTimeInterval ds = 1;
        m_timer = [NSTimer scheduledTimerWithTimeInterval:ds target:self selector:@selector(refresh) userInfo:nil repeats:YES];
    }
}


@end
