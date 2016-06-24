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
#include "audio/include/SimpleAudioEngine.h"

#import "CocosAnimationManager.h"

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
    playBtn.frame = CGRectMake(100, 500, 60, 30);
    playBtn.backgroundColor = [UIColor redColor];
    playBtn.titleLabel.text = @"click me";
    [playBtn addTarget:self action:@selector(playBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playBtn];
    
    UIButton *stopBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    stopBtn.frame = CGRectMake(200, 500, 60, 30);
    stopBtn.backgroundColor = [UIColor redColor];
    stopBtn.titleLabel.text = @"click me";
    [stopBtn addTarget:self action:@selector(stopBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
    self.view.backgroundColor = [UIColor yellowColor];
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"123.png"]];
    background.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
}

- (void)playBtnClicked{
    NSLog(@"playBtnClicked");
    self.animationView.hidden = NO;
    
    [[CocosAnimationManager sharedManager] addAnimation:CAMAnimationSceneHellowWorld];
}

- (void)stopBtnClicked{
    NSLog(@"stopBtnClicked");
    self.animationView.hidden = NO;
    [[CocosAnimationManager sharedManager] addAnimation:CAMAnimationSceneBomb];
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
