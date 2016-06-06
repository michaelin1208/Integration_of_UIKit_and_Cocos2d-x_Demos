//
//  CocosManager.h
//  UIKitCocosLuaTest
//
//  Created by Michaelin on 16/6/6.
//  Copyright © 2016年 Michaelin. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "cocos2d.h"

#import "CocosManager.h"
//#import "AppDelegate.h"
#import "RootViewController.h"
#import "platform/ios/CCEAGLView-ios.h"
#import "base/CCDirector.h"

@interface CocosManager :NSObject
+ (CCEAGLView*)animationViewInViewController:(UIViewController *)viewController;
@end
