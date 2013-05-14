//
//  CAHSwitchViewController.h
//  CAHGenerator
//
//  Created by Tim Carlson on 4/29/13.
//  Copyright (c) 2013 Tim G Carlson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class ViewController;
@class CAHInfoViewController;
@class CAHTitleViewController;

@interface CAHSwitchViewController : UIViewController {
    
    ViewController *homeVC;
    CAHInfoViewController *infoVC;
    CAHTitleViewController *titleVC;
}
@property (retain, nonatomic) ViewController *homeVC;
@property (retain, nonatomic) CAHInfoViewController *infoVC;
@property (retain, nonatomic) CAHTitleViewController *titleVC;

+ (void)switchToHome;
+ (void)switchToInfo;

@end
