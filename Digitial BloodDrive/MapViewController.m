//
//  FirstViewController.m
//  Digitial BloodDrive
//
//  Created by Rohan Sinha on 27/06/15.
//  Copyright (c) 2015 Rohan Sinha. All rights reserved.
//

#import "MapViewController.h"
@import GoogleMaps;

@interface MapViewController ()

@end

@implementation MapViewController {
	GMSMapView *mapView_;
	BOOL firstLocationUpdate_;
	CLLocation* location;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	CLLocationManager *locationManager;
	if (nil == locationManager)
		locationManager = [[CLLocationManager alloc] init];
	
	//locationManager.delegate = self;
	//Configure Accuracy depending on your needs, default is kCLLocationAccuracyBest
	locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
	
	// Set a movement threshold for new events.
	locationManager.distanceFilter = 500; // meters
	
	[locationManager startUpdatingLocation];
	
	// Create a GMSCameraPosition that tells the map to display the
	// coordinate -33.86,151.20 at zoom level 6.
	GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:location.coordinate.latitude
															longitude:location.coordinate.longitude
																 zoom:6];
	mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
	mapView_.myLocationEnabled = YES;
	self.view = mapView_;
	
	// Creates a marker in the center of the map.
	GMSMarker *marker = [[GMSMarker alloc] init];
	marker.position = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
	marker.title = @"Sydney";
	marker.snippet = @"Australia";
	marker.map = mapView_;
}

- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations {
	// If it's a relatively recent event, turn off updates to save power.
	location = [locations lastObject];
	NSDate* eventDate = location.timestamp;
	NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
	if (fabs(howRecent) < 15.0) {
		// If the event is recent, do something with it.
		NSLog(@"latitude %+.6f, longitude %+.6f\n",
			  location.coordinate.latitude,
			  location.coordinate.longitude);
	}
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
