#import "AppDelegate.h"
#import "LocationsTableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    NSDictionary *mapLocation = @{@"name": @"Walt Disney World",
                                  @"lat": @28.41871,
                                  @"lng": @-81.58121
                                  };
    
    /*//Create a CLLocationCoordinate2D struct named coordinate//*/
    double lat = [mapLocation[@"lat"] doubleValue];
    double lng = [mapLocation[@"lng"] doubleValue];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(lat, lng);

    NSLog(@"lat: %f, lng: %f", coordinate.latitude, coordinate.longitude);
    
    /*//Create the MKPlacemark here//*/
    
    /*//Create the MKMapItem here//*/
    
    /*//Set the MKMapItem properties here//*/
    
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    
    mapItem.name = mapLocation[@"name"];
    mapItem.phoneNumber = @"407-555-1212";
    
    /* Open a map item in Apple Maps */
    NSDictionary *mapLaunchOptions = @{
                                       MKLaunchOptionsMapTypeKey: @(MKMapTypeSatellite),
                                       MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
                                       };
    [mapItem openInMapsWithLaunchOptions:mapLaunchOptions];

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //kmav added start:
    LocationsTableViewController *locTVC = [[LocationsTableViewController alloc] init];
    self.window.rootViewController = locTVC;
    //kmav added start:
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
