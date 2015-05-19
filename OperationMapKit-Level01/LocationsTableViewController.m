#import "LocationsTableViewController.h"

@implementation LocationsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locations = @[@{@"name": @"Taco Cantina", @"phoneNumber": @"407-555-3019", @"lat": @28.5464, @"lng": @-81.3844},
                       @{@"name": @"Lou's", @"phoneNumber": @"407-555-1212", @"lat": @28.5336, @"lng": @-81.3735}];
    

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.locations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"locCell" forIndexPath:indexPath];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"locCell"];
    }
    
    cell.textLabel.text = self.locations[indexPath.row][@"name"];
    cell.detailTextLabel.text = self.locations[indexPath.row][@"phoneNumber"];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    

    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    /*//Get the doubleValue of the lat key at position indexPath.row//*/
    /*//Get the doubleValue of the lng key at position indexPath.row//*/
    double latitude = [self.locations[indexPath.row][@"lat"] doubleValue];
    double longitude = [self.locations[indexPath.row][@"lng"] doubleValue];
    
    /*//Create the CLLocationCoordinate2D struct here//*/
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    /*//Log the latitude and longitude values in the struct here//*/
    NSLog(@"lat: %f, lng: %f", coordinate.latitude, coordinate.longitude);
    
    /*//Create an MKPlacemark from the coordinate on the line above//*/
	MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    /*//Create an MKMapItem from the placemark on the line above//*/
	MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    /*//Set the name of the mapItem to the value in the name key of the locations array at indexPath.row//*/
    mapItem.name = self.locations[indexPath.row][@"name"];
    
    /*//Open the mapItem in Apple Maps//*/
    NSDictionary *mapLaunchOptions = @{
                                       MKLaunchOptionsMapTypeKey: @(MKMapTypeSatellite)                                       };
    [mapItem openInMapsWithLaunchOptions:mapLaunchOptions];
    

}


@end