//
//  MySugarAppFlipsideViewController.m
//  MySugarApp
//
//  Created by Charles Konkol on 3/18/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "MySugarAppFlipsideViewController.h"

@interface MySugarAppFlipsideViewController ()

@end

@implementation MySugarAppFlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
