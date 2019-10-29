//
//  ViewController.m
//  GeoFence
//
//  Created by Marcell Purham on 10/29/19.
//  Copyright © 2019 Mattebot, LLC. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () {
}

@property (nonatomic) CLLocationCoordinate2D locationCoord2D;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSMutableArray *geofences;

@end

@implementation ViewController

@synthesize locationCoord2D;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Define geofence
    self.locationCoord2D = CLLocationCoordinate2DMake(41.782910, -88.199455);
    
    // set radius
    CLRegion *connector = [[CLCircularRegion alloc]
                        initWithCenter:self.locationCoord2D
                        radius:100.0
                        identifier:@"Connector"];
    
    // Initialize Location Manager
    self.locationManager = [[CLLocationManager alloc] init];
    
    // Begin monitoring our region
    [self.locationManager startMonitoringForRegion:connector];
        
}



@end
