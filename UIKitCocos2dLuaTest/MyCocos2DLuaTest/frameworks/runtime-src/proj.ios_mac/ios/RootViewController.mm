/****************************************************************************
 Copyright (c) 2010-2011 cocos2d-x.org
 Copyright (c) 2010      Ricardo Quesada
 
 http://www.cocos2d-x.org
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#import "RootViewController.h"
#import "cocos2d.h"
#import "platform/ios/CCEAGLView-ios.h"
#include "SimpleConfigParser.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"
#include "audio/include/SimpleAudioEngine.h"
#include "scripting/lua-bindings/manual/lua_module_register.h"

#if (CC_TARGET_PLATFORM != CC_PLATFORM_LINUX)
#include "CodeIDESupport.h"
#endif

#if (COCOS2D_DEBUG > 0) && (CC_CODE_IDE_DEBUG_SUPPORT > 0)
#include "runtime/Runtime.h"
#include "ide-support/RuntimeLuaImpl.h"
#endif

@implementation RootViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    playBtn.frame = CGRectMake(100, 300, 60, 30);
    playBtn.backgroundColor = [UIColor redColor];
    playBtn.titleLabel.text = @"click me";
    [playBtn addTarget:self action:@selector(playBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playBtn];
    
    UIButton *stopBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    stopBtn.frame = CGRectMake(200, 300, 60, 30);
    stopBtn.backgroundColor = [UIColor redColor];
    stopBtn.titleLabel.text = @"click me";
    [stopBtn addTarget:self action:@selector(stopBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)playBtnClicked{
    NSLog(@"playBtnClicked");
    self.animationView.hidden = NO;
//    cocos2d::Director::getInstance()->restart();
    
    // set default FPS
    Director::getInstance()->setAnimationInterval(1.0 / 60.0f);
    
    // register lua module
    auto engine = LuaEngine::getInstance();
    ScriptEngineManager::getInstance()->setScriptEngine(engine);
    lua_State* L = engine->getLuaStack()->getLuaState();
    lua_module_register(L);
    
//    register_all_packages();
    
    LuaStack* stack = engine->getLuaStack();
    stack->setXXTEAKeyAndSign("2dxLua", strlen("2dxLua"), "XXTEA", strlen("XXTEA"));
    
    //register custom function
    //LuaStack* stack = engine->getLuaStack();
    //register_custom_function(stack->getLuaState());
    
#if (COCOS2D_DEBUG > 0) && (CC_CODE_IDE_DEBUG_SUPPORT > 0)
    // NOTE:Please don't remove this call if you want to debug with Cocos Code IDE
    auto runtimeEngine = RuntimeEngine::getInstance();
    runtimeEngine->addRuntime(RuntimeLuaImpl::create(), kRuntimeEngineLua);
    runtimeEngine->start();
#else
    if (engine->executeScriptFile("src/main.lua"))
    {
        NSLog(@"executeScriptFile src/main.lua");
    }
#endif
}

- (void)stopBtnClicked{
    NSLog(@"stopBtnClicked");
    self.animationView.hidden = YES;
//    cocos2d::Director::getInstance()->pause();
    
}
 

// Override to allow orientations other than the default portrait orientation.
// This method is deprecated on ios6
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    if (SimpleConfigParser::getInstance()->isLanscape()) {
//        return UIInterfaceOrientationIsLandscape( interfaceOrientation );
//    }else{
//        return UIInterfaceOrientationIsPortrait( interfaceOrientation );
//    }
//}
//
//// For ios6, use supportedInterfaceOrientations & shouldAutorotate instead
//- (NSUInteger) supportedInterfaceOrientations{
//#ifdef __IPHONE_6_0
//    if (SimpleConfigParser::getInstance()->isLanscape()) {
//        return UIInterfaceOrientationMaskLandscape;
//    }else{
//        return UIInterfaceOrientationMaskPortrait;
//    }
//#endif
//}
//
//- (BOOL) shouldAutorotate {
//    if (SimpleConfigParser::getInstance()->isLanscape()) {
//        return YES;
//    }else{
//        return NO;
//    }
//}
//
//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
//    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
//
//    cocos2d::GLView *glview = cocos2d::Director::getInstance()->getOpenGLView();
//
//    if (glview)
//    {
//        CCEAGLView *eaglview = (__bridge CCEAGLView*) glview->getEAGLView();
//
//        if (eaglview)
//        {
//            CGSize s = CGSizeMake([eaglview getWidth], [eaglview getHeight]);
//            cocos2d::Application::getInstance()->applicationScreenSizeChanged((int) s.width, (int) s.height);
//        }
//    }
//}
//
////fix not hide status on ios7
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
}


@end
