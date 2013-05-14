//
//  CAHInfoViewController.m
//  CAHGenerator
//
//  Created by Tim Carlson on 4/19/13.
//  Copyright (c) 2013 Tim G Carlson. All rights reserved.
//

#import "CAHInfoViewController.h"
#import "CAHSwitchViewController.h"

@interface CAHInfoViewController ()

@end

@implementation CAHInfoViewController
@synthesize webTimLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super viewDidLoad];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            // iPhone Classic
            [[NSBundle mainBundle] loadNibNamed:@"CAHInfoViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"CAHInfoViewController-5" owner:self options:nil];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backToHome:(id)sender
{
    [CAHSwitchViewController switchToHome];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	//See if touch was inside the label
	if (CGRectContainsPoint(webTimLabel.frame, [[[event allTouches] anyObject] locationInView:self.view]))
	{
		//Open webpage
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.timgcarlson.com"]];
	}
}

@end
