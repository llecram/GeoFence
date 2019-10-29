//
//  AppDelegate.h
//  GeoFence
//
//  Created by Marcell Purham on 10/29/19.
//  Copyright © 2019 Mattebot, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;
@property (strong, nonatomic) UIWindow *window;

@end

