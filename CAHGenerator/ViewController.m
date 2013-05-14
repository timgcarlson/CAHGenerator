//
//  ViewController.m
//  CAHgenerator
//
//  Created by Tim G. Carlson on 4/9/13.
//  Cards Against Humanity is available under a BY-NC-SA 2.0 Creative Commons license.
//

#import "ViewController.h"
#import "CAHInfoViewController.h"
#import "CAHSwitchViewController.h"

@implementation ViewController

- (void)loadView
{
    [super viewDidLoad];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            // iPhone Classic
            [[NSBundle mainBundle] loadNibNamed:@"ViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"ViewController-5" owner:self options:nil];
        }
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    blackCardDisplayed = NO;
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // load black cards
        NSString *bCardString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]
                                                                    pathForResource:@"BlackCardsSingle" ofType:@"txt"]
                                                          encoding:NSUTF8StringEncoding
                                                             error:nil];
        blackCards = [bCardString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        
        // load white cards
        NSString *wCardString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]
                                                                    pathForResource:@"WhiteCards" ofType:@"txt"]
                                                          encoding:NSUTF8StringEncoding
                                                             error:nil];
        whiteCards = [wCardString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        
        NSLog(@"%@", blackCards);
        NSLog(@"%@", whiteCards);
        NSLog(@"Number of BLACK cards: %u",[blackCards count]);
        NSLog(@"Number of WHITE cards: %u",[whiteCards count]);
    }
    return self;
}

- (IBAction)showBlackCard:(id)sender
{
    NSString *bCard = [blackCards objectAtIndex:(abs(arc4random()) % [blackCards count])];
    NSLog(@"Displaying question: %@",bCard);
    // Display the black card string in the text field
    [blackCardField setText:bCard];
    blackCardDisplayed = YES;
    
    // Clear the white card field
    [whiteCardField setText:@"???"];
}

- (IBAction)showWhiteCard:(id)sender
{
    if (blackCardDisplayed) {
        NSString *wCard = [whiteCards objectAtIndex:(abs(arc4random()) % [whiteCards count])];
        NSLog(@"Displaying question: %@",wCard);
        // Display the white card string in the text field
        [whiteCardField setText:wCard];
    }
}

- (IBAction)showInfoView:(id)sender
{
    [CAHSwitchViewController switchToInfo];
}

@end
