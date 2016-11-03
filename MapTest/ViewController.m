//
//  ViewController.m
//  MapTest
//
//  Created by Huafei Wang on 10/30/16.
//  Copyright © 2016 Huafei Wang. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _locationManager = [[CLLocationManager alloc] init];
    
    [_locationManager requestWhenInUseAuthorization];
    
    self.mapView.delegate = self;
    
    self.mapView.showsUserLocation = YES;
    
    NSString *base = [[[NSBundle mainBundle] bundleURL] absoluteString];
    NSString *template = [base stringByAppendingString:@"/US1/{z}/{x}/{y}.png"];
    
//    NSString *template = @"https://c.tile.openstreetmap.org/{z}/{x}/{y}.png";
    
    MKTileOverlay *overlay = [[MKTileOverlay alloc] initWithURLTemplate:template];
    overlay.canReplaceMapContent = YES;
    [self.mapView addOverlay:overlay
                       level:MKOverlayLevelAboveLabels];
//    [self.view addSubview:_mapView];
}


-(MKOverlayRenderer *)mapView:(MKMapView *)mapView
           rendererForOverlay:(id<MKOverlay>)overlay {
    
    if ([overlay isKindOfClass:[MKTileOverlay class]]) {
        return [[MKTileOverlayRenderer alloc] initWithTileOverlay:overlay];
    }
    return nil;
}

@end
