//
//  ViewController.m
//  UIKitCocosTest
//
//  Created by Michaelin on 16/6/3.
//  Copyright © 2016年 Michaelin. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
//        self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 400)];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    testBtn.frame = CGRectMake(100, 300, 20, 20);
    testBtn.backgroundColor = [UIColor redColor];
    [testBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)btnClicked{
    NSLog(@"click click ");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
