#include "HelloWorldScene.h"
#include "SimpleAudioEngine.h"
#include "editor-support/cocostudio/CocoStudio.h"
#import "CocosAnimationManager.h"

USING_NS_CC;

Scene* HelloWorld::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = HelloWorld::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }
    
    auto visibleSize = Director::getInstance()->getVisibleSize();
    printf("visibleSize %f %f %f %f", visibleSize.width,visibleSize.height,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height);
    Vec2 origin = Director::getInstance()->getVisibleOrigin();

    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    //动画 动画 csb
    //    auto rootNode = CSLoader::createNode("tmp.csb");
    //    rootNode->setPosition(Vec2(visibleSize.width/2, visibleSize.height/2));
    //    addChild(rootNode);
    //    auto action = CSLoader::createTimeline("tmp.csb");
    //    rootNode->runAction(action);
    //    action->gotoFrameAndPlay(0, true);

    auto node = CSLoader::getInstance()->createNodeWithFlatBuffersForSimulator("HelloWorldNode.csd");
    node->setPosition(Vec2(visibleSize.width/2, visibleSize.height/2));
    this->addChild(node);
    
    cocostudio::timeline::ActionTimeline* action = cocostudio::timeline::ActionTimelineCache::getInstance()->createActionWithFlatBuffersForSimulator("HelloWorldNode.csd");
    action->setLastFrameCallFunc(CC_CALLBACK_0(HelloWorld::animationFinishCallback,this));
//    ccocs2d::FiniteTimeAction* action = cocos2d::FiniteTimeAction::getInstance()->createActionWithFlatBuffersForSimulator("Node.csd");
//    cocos2d::FiniteTimeAction* sequence = cocos2d::Sequence::create(
//                                                     action,
//                                                     cocos2d::CallFunc::create(this, callfunc_selector(HelloWorld::animationFinishCallback)),
//                                                     NULL);
    
    if (action)
    {
        node->runAction(action);
        action->gotoFrameAndPlay(0,false);
    }
    
    return true;
}

void HelloWorld::animationFinishCallback()
{
    printf("animationFinishCallback");
    [[CocosAnimationManager sharedManager] lastAnimationFinished];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"lastAnimationFinished" object:nil];
}

void HelloWorld::menuCloseCallback(Ref* pSender)
{
    Director::getInstance()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    exit(0);
#endif
}
