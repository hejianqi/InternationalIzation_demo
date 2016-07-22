//
//  ViewController.m
//  InternationalIzation_demo
//
//  Created by hjq on 16/7/21.
//  Copyright © 2016年 UTOUU. All rights reserved.
//

#import "ViewController.h"
#import "InternationalControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

// 1、===============跟随系统语言实现的国际化=========================
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2 - 100, 100, 200, 30);
    
    label.text = [NSString stringWithFormat:@"%@, %@", NSLocalizedString(@"key", nil), NSLocalizedString(@"key2", nil)];
    [self.view addSubview:label];
    
    
// 2、===============程序内部的切换语言版本=========================
    
    _label = [UILabel new];
    _label.frame = CGRectMake(0, 0, 200, 30);
    _label.backgroundColor = [UIColor grayColor];
    _label.center = self.view.center;
    [self.view addSubview:_label];
    
    _btchange = [UIButton buttonWithType:UIButtonTypeCustom];
    _btchange.backgroundColor = [UIColor greenColor];
    [_btchange addTarget:self action:@selector(changeLanguage:) forControlEvents:UIControlEventTouchUpInside];
    _btchange.frame = CGRectMake(CGRectGetMinX(_label.frame), CGRectGetMaxY(_label.frame)+40, 200, 30);
    [self.view addSubview:_btchange];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeLanguage) name:@"changeLanguage" object:nil];
    
    [InternationalControl initUserLanguage];
    
    NSBundle *bundle = [InternationalControl bundle];
    
    NSString *inviteMsg = [bundle localizedStringForKey:@"invite" value:nil table:@"Localizable"];
    
    NSString *buttonInfo = [bundle localizedStringForKey:@"buttonInfo" value:nil table:@"Localizable"];
    
    [_btchange setTitle:buttonInfo forState:UIControlStateNormal];
    
    _label.text = inviteMsg;
    
}


//切换语言点击事件
- (void)changeLanguage:(id)sender{
    
    NSString *lan = [InternationalControl userLanguage];
    
    NSLog(@"---------%@", lan);
    
    if ([lan isEqualToString:@"en"]){
        
        [InternationalControl setUserlanguage:@"zh-Hans"];
        
    }
    else{
        
        [InternationalControl setUserlanguage:@"en"];
        
    }
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"changeLanguage" object:nil];
    
}

- (void)changeLanguage{
    
    [_btchange setTitle:[[InternationalControl bundle] localizedStringForKey:@"buttonInfo" value:nil table:@"Localizable"]  forState:UIControlStateNormal];
    _label.text = [[InternationalControl bundle] localizedStringForKey:@"invite" value:nil table:@"Localizable"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
