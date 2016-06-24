#ifndef __BOMB_SCENE_H__
#define __BOMB_SCENE_H__

#include "cocos2d.h"

class Bomb : public cocos2d::Layer
{
public:
    static cocos2d::Scene* createScene();

    virtual bool init();
    
    void animationFinishCallback();
    // a selector callback
    void menuCloseCallback(cocos2d::Ref* pSender);
    
    // implement the "static create()" method manually
    CREATE_FUNC(Bomb);
};

#endif // __BOMB_SCENE_H__
