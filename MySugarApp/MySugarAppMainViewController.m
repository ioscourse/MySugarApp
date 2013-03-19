//
//  MySugarAppMainViewController.m
//  MySugarApp
//
//  Created by Charles Konkol on 3/18/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//
//1) add needed header files for sqllite
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "FMResultSet.h"
#import "MySugarAppMainViewController.h"

@interface MySugarAppMainViewController ()

@end

@implementation MySugarAppMainViewController
//2) Synthesize
@synthesize txtBloodSugar=txtBloodSugar;
@synthesize scrollView=scrollView;
@synthesize TextViews=TextViews;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //3 Keyboard Hide
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(MySugarAppFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}
//4 all other code
-(void)dismissKeyboard {
    [txtBloodSugar resignFirstResponder];
    [TextViews resignFirstResponder];
}
- (IBAction)btnSave:(id)sender {
    [txtBloodSugar resignFirstResponder];
    [TextViews resignFirstResponder];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"mysugar.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    [database open];
	// Do any additional setup after loading the view, typically from a nib.
    //Date to write
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    NSString *strDate = [NSString stringWithFormat:@"%02d/%02d/%02d -- %02d:%02d:%2.0f", currentDate.month,currentDate.day,(int)currentDate.year, currentDate.hour, currentDate.minute, currentDate.second];
    [database beginTransaction];
    [database executeUpdate:@"insert into mysugar(date, level, note) values(?,?,?)",
     strDate,txtBloodSugar.text,TextViews.text];
    [database commit];
    [database close];
    txtBloodSugar.text=@"";
    TextViews.text = @"";
}
-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [scrollView setContentOffset:scrollPoint animated:YES];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointZero animated:YES];
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    CGPoint scrollPoint = CGPointMake(0, textView.frame.origin.y);
    [scrollView setContentOffset:scrollPoint animated:YES];
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    [scrollView setContentOffset:CGPointZero animated:YES];
}
- (IBAction)btnBack:(id)sender {
    [scrollView setContentOffset:CGPointZero animated:YES];
}
- (void)viewDidUnload {
    
    [super viewDidUnload];
}



@end
