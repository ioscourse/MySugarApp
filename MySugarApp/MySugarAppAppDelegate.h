//
//  MySugarAppAppDelegate.h
//  MySugarApp
//
//  Created by Charles Konkol on 3/18/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySugarAppAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//1) database path
@property NSString *databasename;
@property NSString *databasepath;
@property NSArray *documentPaths;
@property NSString *documentsDir;
@property NSFileManager *appdelfilemanager;
@end
