//
//  ViewController.h
//  CAHgenerator
//
//  Created by Tim G. Carlson on 4/9/13.
//  Cards Against Humanity is available under a BY-NC-SA 2.0 Creative Commons license.
//

#import <UIKit/UIKit.h>
#include <stdlib.h>

@interface ViewController : UIViewController
{
    BOOL blackCardDisplayed;
    
    // The model objects
    NSArray *blackCards;
    NSArray *whiteCards;
    
    // The view objects
    IBOutlet UILabel *blackCardField;
    IBOutlet UILabel *whiteCardField;
}

// Button actions
- (IBAction)showBlackCard:(id)sender;
- (IBAction)showWhiteCard:(id)sender;
- (IBAction)showInfoView:(id)sender;

@end
