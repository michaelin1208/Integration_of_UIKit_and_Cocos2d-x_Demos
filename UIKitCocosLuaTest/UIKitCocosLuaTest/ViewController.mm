//
//  ViewController.m
//  UIKitCocosLuaTest
//
//  Created by Michaelin on 16/6/6.
//  Copyright © 2016年 Michaelin. All rights reserved.
//

#import "ViewController.h"
#import "CocosManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClicked:(id)sender {
    NSLog(@"clicked clicked");
    
    UIView *view = [CocosManager animationViewInViewController:self];
    [self.view addSubview:view];
}

@end
