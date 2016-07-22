//
//  InternationalControl.m
//  InternationalIzation_demo
//
//  Created by hjq on 16/7/22.
//  Copyright © 2016年 UTOUU. All rights reserved.
//

#import "InternationalControl.h"

@implementation InternationalControl

static NSBundle *bundle = nil;

+ (NSBundle *)bundle{
    
    return bundle;
    
}

+ (void)initUserLanguage{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    NSString *string = [def valueForKey:@"userLanguage"];
    
    if (string.length == 0){
        
        //获取系统当前语言版本（中文zh-Hans,英文en）
        
        NSArray *languages = [def objectForKey:@"AppleLanguages"];
        
        NSString *current = [languages objectAtIndex:0];
        
        string = current;
        
        NSLog(@"-------%@", current);
        [def setValue:current forKey:@"userLanguage"];
        
        
        [def synchronize];//持久化
        
    }
    
    //获取文件路径
    
    NSString *path = [[NSBundle mainBundle]pathForResource:string ofType:@"lproj"];
    
    bundle = [NSBundle bundleWithPath:path];//生成bundle
    
}

+ (NSString *)userLanguage{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    NSString *language = [def valueForKey:@"userLanguage"];
    
    return language;
    
}

+ (void)setUserlanguage:(NSString *)language{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    //改变bundle的值
    NSString *path = [[NSBundle mainBundle]pathForResource:language ofType:@"lproj"];
    
    bundle = [NSBundle bundleWithPath:path];
    
    //持久化
    [def setValue:language forKey:@"userLanguage"];
    
    [def synchronize];
    
}


@end
