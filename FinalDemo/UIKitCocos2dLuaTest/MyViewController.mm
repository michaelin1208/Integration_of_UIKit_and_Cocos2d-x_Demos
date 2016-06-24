//
//  ViewController.m
//  UIKitCocos2dLuaTest
//
//  Created by Michaelin on 16/6/6.
//  Copyright © 2016年 Michaelin. All rights reserved.
//

#import "MyViewController.h"
#import "cocos2d.h"

#import "CocosAppDelegate.h"
#import "RootViewController.h"
#import "platform/ios/CCEAGLView-ios.h"
#import "MyViewController.h"
#import "CocosAnimationManager.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 30, 30);
    btn.backgroundColor = [UIColor redColor];
    btn.titleLabel.text = @"click me";
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClicked{
    NSLog(@"btn clicked ");

    // Use RootViewController manage CCEAGLView
    RootViewController *tempViewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
//    tempViewController.wantsFullScreenLayout = YES;
    tempViewController.animationView = [[CocosAnimationManager sharedManager] animationView];
    tempViewController.animationView.hidden = YES;
    [tempViewController.view addSubview:tempViewController.animationView];

    [self presentViewController:tempViewController animated:YES completion:^{
        
    }];
}

@end
