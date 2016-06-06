//
//  CocosManager.m
//  UIKitCocosLuaTest
//
//  Created by Michaelin on 16/6/6.
//  Copyright © 2016年 Michaelin. All rights reserved.
//

#import "CocosManager.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"
#include "audio/include/SimpleAudioEngine.h"
#include "scripting/lua-bindings/manual/lua_module_register.h"

@implementation CocosManager

#pragma mark -
#pragma mark Application lifecycle
//
//// cocos2d application instance
//static AppDelegate s_sharedApplication;

+ (CCEAGLView*)animationViewInViewController:(UIViewController *)viewController {
    
//    cocos2d::Application *app = cocos2d::Application::getInstance();
//    app->initGLContextAttrs();
//    cocos2d::GLViewImpl::convertAttrs();
//    
//    // Override point for customization after application launch.
//    
//    // Add the view controller's view to the window and display.
//    CCEAGLView *eaglView = [CCEAGLView viewWithFrame: frame
//                                         pixelFormat: (__bridge NSString*)cocos2d::GLViewImpl::_pixelFormat
//                                         depthFormat: cocos2d::GLViewImpl::_depthFormat
//                                  preserveBackbuffer: NO
//                                          sharegroup: nil
//                                       multiSampling: NO
//                                     numberOfSamples: 0 ];
//    
//    [eaglView setMultipleTouchEnabled:YES];
//    
//    
//    
//    // IMPORTANT: Setting the GLView should be done after creating the RootViewController
//    cocos2d::GLView *glview = cocos2d::GLViewImpl::createWithEAGLView((__bridge void*)eaglView);
//    cocos2d::Director::getInstance()->setOpenGLView(glview);
//    
//    app->run();
    
    
    
//    cocos2d::Director *director = cocos2d::Director::getInstance();
//    // Add the view controller's view to the window and display.
//    CCEAGLView *eaglView = [CCEAGLView viewWithFrame: CGRectMake(0, 0, 200, 200)
//                                         pixelFormat: (__bridge NSString*)cocos2d::GLViewImpl::_pixelFormat
//                                         depthFormat: cocos2d::GLViewImpl::_depthFormat
//                                  preserveBackbuffer: NO
//                                          sharegroup: nil
//                                       multiSampling: NO
//                                     numberOfSamples: 0 ];
//    
//    [eaglView setMultipleTouchEnabled:YES];
//
//    cocos2d::GLView *glview = cocos2d::GLViewImpl::createWithEAGLView((__bridge void*)eaglView);
//    director->setOpenGLView(glview);
//    
//    viewController.view = eaglView;
//    
//    
//    
//    
//    // register lua module
//    auto engine = cocos2d::LuaEngine::getInstance();
//    cocos2d::ScriptEngineManager::getInstance()->setScriptEngine(engine);
//    lua_State* L = engine->getLuaStack()->getLuaState();
//    lua_module_register(L);
//    
////    register_all_packages();
//    
//    cocos2d::LuaStack* stack = engine->getLuaStack();
//    stack->setXXTEAKeyAndSign("2dxLua", strlen("2dxLua"), "XXTEA", strlen("XXTEA"));
//    
//    //register custom function
//    //LuaStack* stack = engine->getLuaStack();
//    //register_custom_function(stack->getLuaState());
//    
//#if (COCOS2D_DEBUG > 0) && (CC_CODE_IDE_DEBUG_SUPPORT > 0)
//    // NOTE:Please don't remove this call if you want to debug with Cocos Code IDE
//    auto runtimeEngine = RuntimeEngine::getInstance();
//    runtimeEngine->addRuntime(RuntimeLuaImpl::create(), kRuntimeEngineLua);
//    runtimeEngine->start();
//#else
//    if (engine->executeScriptFile("src/main.lua"))
//    {
//    }
//#endif

    cocos2d::LuaEngine *engine = cocos2d::LuaEngine::getInstance();
    
    return nil;
}

@end
