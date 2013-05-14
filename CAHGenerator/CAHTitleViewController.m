//
//  CAHTitleViewController.m
//  CAHGenerator
//
//  Created by Tim Carlson on 4/29/13.
//  Copyright (c) 2013 Tim G Carlson. All rights reserved.
//

#import "CAHTitleViewController.h"
#import "CAHSwitchViewController.h"

@interface CAHTitleViewController ()

@end

@implementation CAHTitleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startGame:(UIButton *)sender
{
    NSLog(@"Abbout to switch to the game view");
    [CAHSwitchViewController switchToHome];
}

@end
