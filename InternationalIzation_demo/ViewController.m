//
//  ViewController.m
//  InternationalIzation_demo
//
//  Created by hjq on 16/7/21.
//  Copyright © 2016年 UTOUU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(0, 0, 200, 30);
    label.center = self.view.center;
    label.text = [NSString stringWithFormat:@"%@, %@", NSLocalizedString(@"key", nil), NSLocalizedString(@"key2", nil)];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
