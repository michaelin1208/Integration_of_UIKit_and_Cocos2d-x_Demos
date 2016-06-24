//
//  CocosAnimationManager.m
//  UIKitCocos2dLuaTest
//
//  Created by Michaelin on 16/6/16.
//  Copyright © 2016年 Michaelin. All rights reserved.
//

#import "CocosAnimationManager.h"
@interface CocosAnimationManager(){
    Director *director;
//    __Array *animationScenes;
}

@property (nonatomic, strong) NSMutableArray *waitingAnimations;
@property (nonatomic) Boolean isRunning;
@property (nonatomic, strong) CCEAGLView *animationView;

@end

static CocosAnimationManager *sharedCocosAnimationManger;

@implementation CocosAnimationManager

+ (CocosAnimationManager *)sharedManager{
    @synchronized (self) {
        if (sharedCocosAnimationManger == nil) {
            sharedCocosAnimationManger = [[CocosAnimationManager alloc] init];
        }
    }
    return sharedCocosAnimationManger;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.waitingAnimations = [[NSMutableArray alloc] init];
        self.isRunning = NO;
        
        [self initAnimationView];
        [self initAnimationScenes];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lastAnimationFinished) name:@"lastAnimationFinished" object:nil];
    }
    return self;
}

- (void)initAnimationView{
    CGRect animationFrame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    // Add the view controller's view to the window and display.
    self.animationView = [CCEAGLView viewWithFrame: animationFrame
                                       pixelFormat: kEAGLColorFormatRGBA8 //allow you to set the alpha value
                                       depthFormat: 0
                                preserveBackbuffer: NO
                                        sharegroup: nil
                                     multiSampling: NO
                                   numberOfSamples: 0 ];
    
    self.animationView.backgroundColor = [UIColor clearColor];    //set the background color to clear color
    self.animationView.opaque = NO;       //let the view can be transparent
    self.animationView.userInteractionEnabled = NO;
//    [self.animationView setMultipleTouchEnabled:YES];
    
    // initialize director
    director = Director::getInstance();
    
    GLView *glview = GLViewImpl::createWithEAGLView((__bridge void*)self.animationView);
    director->setOpenGLView(glview);
//    director->getOpenGLView()->setDesignResolutionSize(animationFrame.size.width,300,ResolutionPolicy::FIXED_WIDTH);
    
    
    // turn on display FPS
    director->setDisplayStats(true);
    
    // set FPS. the default value is 1.0/60 if you don't call this
    director->setAnimationInterval(1.0 / 60);
}

- (void)initAnimationScenes{
//    animationScenes = __Array::create();
//    animationScenes->retain();
//    
//    Scene *helloWorldScene = HelloWorld::createScene();
//    animationScenes->addObject(helloWorldScene);
//    
//    Scene *bombScene = Bomb::createScene();
//    animationScenes->addObject(bombScene);
}

- (void)lastAnimationFinished{
    director->getTextureCache()->removeUnusedTextures();
    self.isRunning = NO;
    [self startNextAniamtion];
}

- (void)startNextAniamtion{
    @synchronized (self.waitingAnimations) {
        NSLog(@"self.waitingAnimations.count %d %d",self.isRunning, self.waitingAnimations.count);
        if (!self.isRunning && self.waitingAnimations.count > 0) {
            self.isRunning = YES;
            CAMAnimationScene animationScene = (CAMAnimationScene)[[self.waitingAnimations objectAtIndex:0] integerValue];
            [self.waitingAnimations removeObjectAtIndex:0];
            [self runAnimation:animationScene];
        }
    }
}

- (void)runAnimation:(CAMAnimationScene)animationScene{
    // run
    Scene *nextScene;
    switch (animationScene) {
        case CAMAnimationSceneHellowWorld:
            nextScene = HelloWorld::createScene();
            break;
            
        case CAMAnimationSceneBomb:
            nextScene = Bomb::createScene();
            CocosDenshion::SimpleAudioEngine::getInstance()->playBackgroundMusic("bomb.mp3");
            break;
            
        default:
            self.isRunning = NO;
            return;
            break;
    }
    
    if (director->getRunningScene() != nil){
        director->replaceScene(nextScene);
    }else{
        director->runWithScene(nextScene);
    }
}

- (void)addAnimation:(CAMAnimationScene)animationScene{
    @synchronized (self.waitingAnimations) {
        [self.waitingAnimations addObject:[NSNumber numberWithInteger:animationScene]];
        if (!self.isRunning) {
            [self startNextAniamtion];
        }
    }
}

//// get the animation view to show the animation
//- (CCEAGLView *)animationView{
//    return self.animationView;
//}

@end
