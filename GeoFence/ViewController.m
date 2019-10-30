//
//  ViewController.m
//  GeoFence
//
//  Created by Marcell Purham on 10/29/19.
//  Copyright © 2019 Mattebot, LLC. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate> {
    __weak IBOutlet UILabel *status;
}

@property (nonatomic) CLLocationCoordinate2D locationCoord2D;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSMutableArray *geofences;

@end

@implementation ViewController

@synthesize locationCoord2D;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if(![CLLocationManager locationServicesEnabled]) {
        
        NSLog(@"You need to enable location services to use this app.");
    }
    
    // Define geofence lat and long
    // TODO: Add input fields for lat and long
    self.locationCoord2D = CLLocationCoordinate2DMake(40.071339, -115.341920);
    
    // set radius
    CLRegion *connector = [[CLCircularRegion alloc]
                        initWithCenter:self.locationCoord2D
                        radius:1000.0
                        identifier:@"Connector"];
    
    // Initialize Location Manager
    self.locationManager = [[CLLocationManager alloc] init];
    
    // Begin monitoring our region
    [self.locationManager startMonitoringForRegion:connector];
    
    [self.geofences addObject:connector];
    
    // Set delegates for watching for events
    [self.locationManager setDelegate:self];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [self.locationManager setDistanceFilter:kCLLocationAccuracyHundredMeters];

    // Request access to user
    [self.locationManager requestAlwaysAuthorization];
    
    // Start Updating Location
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"entering region");
    //TODO: Do something with data for api
    status.text = @"entering region";
}
 
- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"exiting region");
    //TODO: Do something with data for api
    status.text = @"exiting region";
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    NSLog(@"Started monitoring %@ region", region.identifier);
    status.text = @"Started monitoring...";
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"Upating location");
}

@end
