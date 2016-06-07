//
//  ViewController.m
//  UIKitCocos2dLuaTest
//
//  Created by Michaelin on 16/6/6.
//  Copyright © 2016年 Michaelin. All rights reserved.
//

#import "MyViewController.h"
#import "cocos2d.h"

#import "AppDelegate.h"
#import "RootViewController.h"
#import "platform/ios/CCEAGLView-ios.h"
#import "MyViewController.h"

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

    // Override point for customization after application launch.

    CGRect animationFrame = CGRectMake(0, 0, self.view.frame.size.width, 300);
    
    // Add the view controller's view to the window and display.
    CCEAGLView *eaglView = [CCEAGLView viewWithFrame: animationFrame
                                     pixelFormat: kEAGLColorFormatRGBA8 //allow you to set the alpha value
                                     depthFormat: 0
                              preserveBackbuffer: NO
                                      sharegroup: nil
                                   multiSampling: NO
                                 numberOfSamples: 0 ];
    
    eaglView.backgroundColor = [UIColor clearColor];    //set the background color to clear color
    eaglView.opaque = NO;       //let the view can be transparent

    [eaglView setMultipleTouchEnabled:YES];

    // Use RootViewController manage CCEAGLView
    RootViewController *tempViewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
//    tempViewController.wantsFullScreenLayout = YES;
    tempViewController.animationView = eaglView;
    tempViewController.animationView.hidden = YES;
    [tempViewController.view addSubview:tempViewController.animationView];

    [self presentViewController:tempViewController animated:YES completion:^{
        
    }];
    
//    cocos2d::Application *app = cocos2d::Application::getInstance();
//    app->initGLContextAttrs();
//    cocos2d::GLViewImpl::convertAttrs();
    //    // IMPORTANT: Setting the GLView should be done after creating the RootViewController
    cocos2d::GLView *glview = cocos2d::GLViewImpl::createWithEAGLView((__bridge void*)eaglView);
    cocos2d::Director::getInstance()->setOpenGLView(glview);
//
//    app->run();
}

@end
