//
//  CAHSwitchViewController.m
//  CAHGenerator
//
//  Created by Tim Carlson on 4/29/13.
//  Copyright (c) 2013 Tim G Carlson. All rights reserved.
//

#import "CAHSwitchViewController.h"
#import "ViewController.h"
#import "CAHInfoViewController.h"
#import "CAHTitleViewController.h"

@interface CAHSwitchViewController ()

@end

@implementation CAHSwitchViewController

@synthesize homeVC;
@synthesize infoVC;
@synthesize titleVC;

static CAHSwitchViewController *instance = NULL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


+ (void) switchToHome
{
    if (instance.homeVC.view.superview == nil) {
        if (instance.homeVC == nil) {
            instance.homeVC =
            [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        }
        UIViewAnimationOptions animation;
        float transitionTime;
        if (instance.titleVC.view.superview) {
            animation = UIViewAnimationOptionTransitionCrossDissolve;
            transitionTime = 0.75;
        } else {
            animation = UIViewAnimationOptionTransitionFlipFromRight;
            transitionTime = 0.5;
        }
        
        [UIView transitionWithView:instance.view
                          duration:transitionTime
                           options: animation
                        animations:^{
                            [instance.homeVC viewWillAppear:YES];
                            [instance.infoVC viewWillDisappear:YES];
                            [instance.titleVC viewWillDisappear:YES];
            
                            [instance.infoVC.view removeFromSuperview];
                            [instance.titleVC.view removeFromSuperview];
                            [instance.view insertSubview:instance.homeVC.view atIndex:0];
            
                            [instance.homeVC viewDidAppear:YES];
                            [instance.infoVC viewDidDisappear:YES];
                            [instance.titleVC viewWillDisappear:YES];
                        }
                        completion:nil];
    }
}

+(void)switchToInfo{
    if (instance.infoVC.view.superview == nil)
    {
        
        if (instance.infoVC == nil)
        {
            instance.infoVC =
            [[CAHInfoViewController alloc] initWithNibName:@"CAHInfoViewController" bundle:nil];
        }
        
        [UIView transitionWithView:instance.view
                          duration:0.5
                           options: UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
                            [instance.infoVC viewWillAppear:YES];
                            [instance.homeVC viewWillDisappear:YES];
                            [instance.titleVC viewWillDisappear:YES];
            
                            [instance.homeVC.view removeFromSuperview];
                            [instance.titleVC.view removeFromSuperview];
                            [instance.view insertSubview:instance.infoVC.view atIndex:0];
            
                            [instance.infoVC viewWillAppear:YES];
                            [instance.homeVC viewWillDisappear:YES];
                            [instance.titleVC viewWillDisappear:YES];
                            
                        }
                        completion:nil];
    }
}

#pragma mark - Memory Warnings

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{    
    instance = self;
    //CAHTitleViewController *tvc  = [[CAHTitleViewController alloc] initWithNibName:@"CAHTitleViewController" bundle:nil];
    self.titleVC = [[CAHTitleViewController alloc] initWithNibName:@"CAHTitleViewController" bundle:nil];
    [self.view insertSubview:titleVC.view atIndex:0];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
