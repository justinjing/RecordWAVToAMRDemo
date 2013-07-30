//
//  AppDelegate.h
//  AmrConvertAndRecord
//
//  Created by Jeans on 3/29/13.
//  Copyright (c) 2013 Jeans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomWindow.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) CustomWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
