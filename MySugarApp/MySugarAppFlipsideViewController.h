//
//  MySugarAppFlipsideViewController.h
//  MySugarApp
//
//  Created by Charles Konkol on 3/18/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MySugarAppFlipsideViewController;

@protocol MySugarAppFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(MySugarAppFlipsideViewController *)controller;
@end

@interface MySugarAppFlipsideViewController : UIViewController

@property (weak, nonatomic) id <MySugarAppFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
