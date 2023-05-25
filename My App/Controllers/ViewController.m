//
//  ViewController.m
//  My App
//

/*
 TODO: This would be a table view, where you can enter a new band name.
 TODO: Separate view controller (modal?) that handles entering new data.
 */

#import "ViewController.h"
#import "BandNamesController.h"

// Once another protocol is added to an interface
@interface ViewController ()

@end

// Imeplementation is the implementation of a class
@implementation ViewController
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Instantiate the array of band names
    self.tableBandNamesArray = [NSMutableArray array];
    
    // Create the nav bar
    UINavigationBar* navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 55)];
    [self.view addSubview:navBar];
    navBar.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILayoutGuide* safeArea = self.view.safeAreaLayoutGuide;
    
    [NSLayoutConstraint activateConstraints:@[
        [navBar.leadingAnchor constraintEqualToAnchor:safeArea.leadingAnchor],
        [navBar.trailingAnchor constraintEqualToAnchor:safeArea.trailingAnchor],
        [navBar.topAnchor constraintEqualToAnchor:safeArea.topAnchor],
        [navBar.heightAnchor constraintEqualToConstant:55]
    ]];
    
    // Create a nav item
    UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:@"Band Names"];
    [navBar setItems:@[navItem]];
    
    // Create the '+' nav button
    UIBarButtonItem* navButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBandNameTapped)];
    
    navItem.rightBarButtonItem = navButton;
        
    // Create a table view
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

// Nav bar button click
- (void)addBandNameTapped
{
    BandNamesController* bandNamesController = [[BandNamesController alloc] init];
    
    bandNamesController.completionBlock = ^(NSString* newBand)
    {
        if(newBand)
        {
            [self.tableBandNamesArray addObject:newBand];
            
            NSIndexPath* path = [NSIndexPath indexPathForRow:self.tableBandNamesArray.count-1 inSection:0];
            [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    [self presentViewController:bandNamesController animated:YES completion:nil];
}

/*--- BEGIN TABLE VIEW METHODS ---*/
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = self.tableBandNamesArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableBandNamesArray.count;
}
/*--- END TABLE VIEW METHODS ---*/
@end
