//
//  MyDataViewController.m
//  MySugarApp
//
//  Created by Charles Konkol on 3/18/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//
//add db headers
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "FMResultSet.h"
#import "MyDataViewController.h"

@interface MyDataViewController ()

@end

@implementation MyDataViewController
@synthesize ViewData=ViewData;
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
	// Do any additional setup after loading the view.
    ViewData.Text=@"";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"MySugar.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    [database open];
	// Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view, typically from a nib.
    FMResultSet *results = [database executeQuery:@"select * from MySugar"];
    while([results next]) {
        NSString *date = [results stringForColumn:@"date"] ;
        NSString *level = [results stringForColumn:@"level"];
        NSString *note  = [results stringForColumn:@"note"];
        NSString *StrSugar =  [NSString stringWithFormat:@"%@  ---  %@  ---  %@", date,level, note];
        ViewData.Text=[NSString stringWithFormat:@"%@\r%@", ViewData.text,StrSugar];
    }
    //ViewData.Text = [ViewData.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    ViewData.text = [ViewData.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    [results close];
    [database close];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textView:(UITextView *)textView
shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    return YES;
}

- (IBAction)btnClear:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"MySugar.sqlite"];
    //NSLog(@"Path: %@",path);
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    [database open];
	// Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view, typically from a nib.
    [database executeUpdate: @"DELETE FROM MySugar",nil];
    [database close];
    ViewData.Text=@"";
}

@end
