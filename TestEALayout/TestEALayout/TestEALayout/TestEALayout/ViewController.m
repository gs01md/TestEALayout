//
//  ViewController.m
//  TestEALayout
//
//  Created by Simon on 16/5/6.
//  Copyright © 2016年 gaoshuai. All rights reserved.
//

#import "ViewController.h"
#import <EALayout/EALayout.h>
#import "LinerLayoutViewController.h"
#import "RegisterViewController.h"

@interface ViewController ()<EALayoutRefreshDelegate>{
    
    EALayoutRefresh * refresh;
    UIButton *btn;
}
@property (nonatomic, strong) SkinParser* skinParser;
@end

@implementation ViewController

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.automaticallyAdjustsScrollViewInsets = false;
        
        //通过指定文件名创建一个 SkinParser, 我们这里直接使用了当前类名
        _skinParser = [SkinParser getParserByName:NSStringFromClass([self class])];
        
        //eventTarget 是指定在解析 UIButton 或者说 UIControl 时，
        // addTarget: eventTarget  forState:xxx
        //viewController里只实现通过json里指定的方法就可以了，不需要用代码绑定
        _skinParser.eventTarget = self;
        

        [SkinMgr sharedInstance].skinPath = [[NSBundle mainBundle] resourcePath];
        
        #if DEBUG
        //refresh = [EALayoutRefresh shareInstance];
        //refresh.delegate = self;
        #endif
        
    }
    
    return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadView
{
    [super loadView];
    
    //从json里读取叫  @"selfView" 的一个节点， 将属性解析到  参数  self.view 中
    //如果参数  self.view 为 nil , 那在selfView里必须指名 class 属性，以便自动创建,并且返回创建的对象。
    //如果 view参数为 nil, 也可以使用 UIView* view = [_skinParser parse:@"aViewName"];
    
    [_skinParser parse:@"selfView" view:self.view];
    
    
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    //计算布局
    //在代码里对某个控件设置了属性，会影响布局的,就需要调用 spUpdateLayout
    //如 修改了 UILabel* label;   需要调用 [label.superview spUpdateLayout]
    //可以在修改多个控件属性后，再找到一个统一上层的父view, 调用一次即可

    [self.view spUpdateLayout];
    [self.view spUpdateLayout];
    
}


- (void)refreshEALayout {
    
#if DEBUG
    
    self.view = [[UIView alloc] init];
    
    NSString* str = NSStringFromClass([self class]);
    _skinParser = [SkinParser getParserByName:str];
    _skinParser.eventTarget = self;
    
    
    [self loadView];
    [self viewDidLoad];
    
#endif
}


#pragma mark - 登录

- (void) loginAction {
    
    LinerLayoutViewController * vc = [[LinerLayoutViewController alloc] init];
    
    UINavigationController * nav = self.navigationController;
    
    if (nav) {
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}

- (void) forgetAction {
    

    
    
}

- (void) registerAction {
    
    RegisterViewController * vc = [[RegisterViewController alloc] init];
    
    UINavigationController * nav = self.navigationController;
    
    if (nav) {
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
