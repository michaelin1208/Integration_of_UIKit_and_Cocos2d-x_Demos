//
//  CocosAnimationManager.h
//  UIKitCocos2dLuaTest
//
//  Created by Michaelin on 16/6/16.
//  Copyright © 2016年 Michaelin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "CocosAppDelegate.h"
#import "RootViewController.h"
#import "platform/ios/CCEAGLView-ios.h"
#import "MyViewController.h"
#import "HelloWorldScene.h"
#import "BombScene.h"
#import "SimpleAudioEngine.h"

USING_NS_CC;

typedef NS_ENUM(NSInteger, CAMAnimationScene) {
    CAMAnimationSceneHellowWorld = 0,
    CAMAnimationSceneBomb,
};

@interface CocosAnimationManager : NSObject

// get the shared animation manager.
+ (CocosAnimationManager *)sharedManager;

// notice the  animation manager the last animation finished.
- (void)lastAnimationFinished;

// insert animation into animation manager
- (void)addAnimation:(CAMAnimationScene)animationScene;

// get the animation view to show the animation
- (CCEAGLView *)animationView;

@end
